//list used to cache empty zlevels to avoid nedless map bloat
var/global/list/cached_space = list()

//Space stragglers go here

/obj/effect/overmap/visitable/sector/temporary
	name = "Deep Space"
	invisibility = 101
	sector_flags = OVERMAP_SECTOR_IN_SPACE

/obj/effect/overmap/visitable/sector/temporary/Initialize(mapload, var/nx, var/ny, var/nz)
	var/start_loc = locate(1, 1, nz) // This will be moved to the overmap in ..(), but must start on this z level for init to function.
	forceMove(start_loc)
	start_x = nx // This is overmap position
	start_y = ny
	testing("Temporary sector at [x],[y] was created, corresponding zlevel is [nz].")
	. = ..()

/obj/effect/overmap/visitable/sector/temporary/Destroy()
	for(var/num in map_z)
		map_sectors["[num]"] = null
	testing("Temporary sector at [x],[y] was deleted.")
	global.cached_space -= src
	return ..()

/obj/effect/overmap/visitable/sector/temporary/proc/can_die(var/mob/observer)
	testing("Checking if sector at [map_z[1]] can die.")
	for(var/mob/M in global.player_list)
		if(M != observer && (M.z in map_z))
			testing("There are people on it.")
			return 0
	return 1

/proc/get_deepspace(x,y)
	var/obj/effect/overmap/visitable/sector/temporary/res = locate(x,y,global.using_map.overmap_z)
	if(istype(res))
		return res
	else if(length(global.cached_space))
		res = global.cached_space[length(global.cached_space)]
		global.cached_space -= res
		if(istype(res) && !QDELETED(res))
			res.forceMove(locate(x, y, global.using_map.overmap_z))
			return res
	return new /obj/effect/overmap/visitable/sector/temporary(null, x, y, global.using_map.get_empty_zlevel())

/atom/movable/proc/lost_in_space()
	for(var/atom/movable/AM in contents)
		if(!AM.lost_in_space())
			return FALSE
	return TRUE

/mob/lost_in_space()
	return isnull(client)

/mob/living/carbon/human/lost_in_space()
	return isnull(client) && (!last_ckey || stat == DEAD)

/proc/overmap_spacetravel(var/turf/space/T, var/atom/movable/A)
	if (!T || !A)
		return

	var/obj/effect/overmap/visitable/M = map_sectors["[T.z]"]
	if (!M)
		return

	if(A.lost_in_space())
		if(!QDELETED(A))
			qdel(A)
		return

	var/nx = 1
	var/ny = 1
	var/nz = 1

	if(T.x <= TRANSITIONEDGE)
		nx = world.maxx - TRANSITIONEDGE - 2
		ny = rand(TRANSITIONEDGE + 2, world.maxy - TRANSITIONEDGE - 2)

	else if (A.x >= (world.maxx - TRANSITIONEDGE - 1))
		nx = TRANSITIONEDGE + 2
		ny = rand(TRANSITIONEDGE + 2, world.maxy - TRANSITIONEDGE - 2)

	else if (T.y <= TRANSITIONEDGE)
		ny = world.maxy - TRANSITIONEDGE -2
		nx = rand(TRANSITIONEDGE + 2, world.maxx - TRANSITIONEDGE - 2)

	else if (A.y >= (world.maxy - TRANSITIONEDGE - 1))
		ny = TRANSITIONEDGE + 2
		nx = rand(TRANSITIONEDGE + 2, world.maxx - TRANSITIONEDGE - 2)

	testing("[A] spacemoving from [M] ([M.x], [M.y]).")

	var/turf/map = locate(M.x,M.y,global.using_map.overmap_z)
	var/obj/effect/overmap/visitable/TM
	for(var/obj/effect/overmap/visitable/O in map)
		if(O != M && (O.sector_flags & OVERMAP_SECTOR_IN_SPACE) && prob(50))
			TM = O
			break
	if(!TM)
		TM = get_deepspace(M.x,M.y)
	nz = pick(TM.map_z)

	var/turf/dest = locate(nx,ny,nz)
	if(dest && !dest.density)
		A.forceMove(dest)
		if(isliving(A))
			var/mob/living/L = A
			for(var/obj/item/grab/G in L.get_active_grabs())
				G.affecting.forceMove(dest)

	if(istype(M, /obj/effect/overmap/visitable/sector/temporary))
		var/obj/effect/overmap/visitable/sector/temporary/source = M
		if(source.can_die())
			source.forceMove(null)
			if(!QDELETED(source))
				testing("Caching [M] for future use")
				global.cached_space |= source
