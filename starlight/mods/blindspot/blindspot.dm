/////////////BLINDSPOT CONE///////////////
// Blindspot cone code by Honkertron (for Otuska), Matt and Myazaki.
// This blindspot cone code allows for mobs and/or items to be blocked out from a player's field of vision.
// This code makes use of the "cone of effect" proc created by Lummox, contributed by Jtgibson.
//
// More info on that here:
// http://www.byond.com/forum/?post=195138
///////////////////////////////////////

/obj/screen/blindspot_overlay
	name = ""
	icon = 'icons/blindspot.dmi'
	icon_state = "combat"
	screen_loc = "SOUTH, WEST"
	mouse_opacity = FALSE
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/client
	var/list/hidden_atoms = list()
	var/list/hidden_mobs = list()

/proc/cone(turf/center, dir, list/list)
	. = list()
	for(var/turf/T in list)
		if(T.InConeDirection(center, dir))
			for(var/mob/M in T.contents)
				if(!istype(M, /mob/observer))
					. += M.InCone(center, dir)

/turf/proc/InConeDirection(turf/center, dir)
	if(get_dist(center, src) == 0 || src == center) return 0
	var/d = get_dir(center, src)

	if(!d || d == dir) return 1
	if(dir & (dir-1))
		return (d & ~dir) ? 0 : 1
	if(!(d & dir)) return 0
	var/dx = abs(x - center.x)
	var/dy = abs(y - center.y)
	if(dx == dy) return 1
	if(dy > dx)
		return (dir & (NORTH|SOUTH)) ? 1 : 0
	return (dir & (EAST|WEST)) ? 1 : 0

// Should return atoms that are in the cone.
/atom/proc/InCone(turf/center, dir)
	SHOULD_CALL_PARENT(TRUE)
	return list()

/mob/InCone(turf/center, dir)
	. = ..() | src

/mob/proc/update_blindspot_cone()
	return

/mob/living/update_blindspot_cone()
	if(!have_blindspot)
		if(blindspot_overlay)
			remove_cone()
		return

	for(var/obj/item/item in src)
		if(item.zoom)
			remove_cone()
			return

	var/delay = 1 SECONDS
	if(client)
		var/image/I = null
		for(I in client.hidden_atoms)
			I.override = FALSE
			QDEL_IN(I, delay)
			delay += 1 SECONDS

		check_blindspot()
		client.hidden_atoms.Cut()
		client.hidden_mobs.Cut()


		if(resting || lying)
			hide_cone()
			return

		blindspot_overlay.dir = dir
		if(blindspot_overlay.alpha)
			var/turf/T = get_turf(src)
			for(var/cone_atom in cone(T, GLOB.reverse_dir[dir], get_rectangle_in_dir(T, text2num(client.view) + 1, GLOB.reverse_dir[dir]) & oview(text2num(client.view) + 1, T)))
				add_to_mobs_hidden_atoms(cone_atom)

/mob/living/proc/add_to_mobs_hidden_atoms(atom/A)
	var/image/I
	I = image("split", A)
	I.override = TRUE
	client.images += I
	client.hidden_atoms += I
	if(ismob(A))
		var/mob/hidden_mob = A
		client.hidden_mobs += hidden_mob
		for(var/obj/item/grab/G in src)
			if(A == G.affecting)
				I.override = FALSE
				return
		for(var/obj/item/grab/G in A)
			if(src == G.affecting)
				I.override = FALSE
				return

/mob/living/proc/SetBlindspot(n)
	if(!have_blindspot)
		return

	n ? show_cone() : hide_cone()

/mob/living/proc/check_blindspot()
	if(!have_blindspot)
		if(client)
			for(var/hidden in client.hidden_atoms)
				var/image/I = hidden
				client.images -= I
			client.hidden_atoms.Cut()
			client.hidden_mobs.Cut()
			remove_cone()
		return

	if(isnull(blindspot_overlay))
		blindspot_overlay = new /obj/screen/blindspot_overlay()
	client.screen |= blindspot_overlay

	if(resting || lying || client.eye != client.mob)
		blindspot_overlay.alpha = 0
		return

	else if(blindspot_overlay)
		show_cone()
	else
		hide_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/proc/show_cone()
	if(!have_blindspot)
		return

	if(blindspot_overlay)
		blindspot_overlay.alpha = 255

/mob/living/proc/hide_cone()
	if(blindspot_overlay)
		blindspot_overlay.alpha = 0

/mob/living/proc/remove_cone()
	if(blindspot_overlay)
		client.screen -= blindspot_overlay

/mob/living/set_dir(var/new_dir, ignore_facing_dir = FALSE)
	. = ..()
	if(.)
		update_blindspot_cone()

// Rotates a rectangle around a center turf
/proc/get_rectangle_in_dir(var/turf/T, var/length, var/dir)
	var/matrix/M = new
	var/matrix/N = new
	M.Turn(dir2angle(dir))
	N.Turn((dir2angle(dir)+180) % 360)
	. = block(\
		locate(T.x + (M.a+M.b) * length + 0.5*(M.a + M.b - 1), T.y + (M.d+M.e) * length + 0.5*(M.d + M.e - 1), T.z),\
		locate(T.x + N.a * length + 0.5*(M.a + M.b - 1), T.y + N.d * length + 0.5*(M.d + M.e - 1), T.z)\
		)

#define ALWAYS_FOOTSTEP_DISTANCE 2
#define MAX_FOOTSTEP_DISTANCE 5
#define RIPPLE_POSITION_BOUNDS 8
#define RIPPLE_START_RADIUS 10
#define RIPPLE_END_RADIUS 2
#define RIPPLE_START_SIZE 0
#define RIPPLE_END_SIZE 16

/turf/proc/show_footsteps(var/mob/viewer, var/turf/Tviewer, var/mob/M)
	var/dist = get_dist(src, Tviewer)
	if(src == Tviewer)
		return
	if(dist > MAX_FOOTSTEP_DISTANCE || prob(100*max(dist-ALWAYS_FOOTSTEP_DISTANCE,0) / MAX_FOOTSTEP_DISTANCE))
		return
	if(isdeaf(viewer))
		return
	if(viewer.stat || M.stat || M.lying)
		return
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.has_footsteps())
			return

	var/image/marker = image(icon, src, icon_state, layer = layer)
	marker.overlays = overlays.Copy()
	marker.override = TRUE
	marker.filters += filter(type = "ripple", x=rand(-RIPPLE_POSITION_BOUNDS, RIPPLE_POSITION_BOUNDS), y=rand(-RIPPLE_POSITION_BOUNDS, RIPPLE_POSITION_BOUNDS), radius = RIPPLE_START_RADIUS, size = RIPPLE_START_SIZE, falloff = 0)

	viewer.client.images += marker
	QDEL_IN(marker, 1.5 SECONDS)
	animate(marker.filters[marker.filters.len], time = 1.5 SECONDS, radius = RIPPLE_END_RADIUS, size = RIPPLE_END_SIZE)

#undef ALWAYS_FOOTSTEP_DISTANCE
#undef MAX_FOOTSTEP_DISTANCE
#undef RIPPLE_POSITION_BOUNDS
#undef RIPPLE_START_RADIUS
#undef RIPPLE_END_RADIUS
#undef RIPPLE_START_SIZE
#undef RIPPLE_END_SIZE
