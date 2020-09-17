/mob/living
	var/have_blindspot = TRUE
	var/obj/screen/blindspot_overlay = null

/mob/living/UpdateLyingBuckledAndVerbStatus()
	. = ..()
	update_blindspot_cone()

/mob/living/Move()
	. = ..()

	// Other viewers only need to update their vision for this moving mob, not their entire cone, as they are stationary
	for(var/viewer in oviewers(world.view, src))
		var/mob/living/M = viewer
		if(M.client && istype(M) && M.have_blindspot)
			if(text2num(M.client.view) != world.view && get_dist(M, src) > text2num(M.client.view))
				continue
			else
				var/turf/T = get_turf(M)
				var/turf/Ts = get_turf(src)
				if(Ts.InConeDirection(T, GLOB.reverse_dir[M.dir]))
					if(!(src in M.client.hidden_mobs))
						if(M.InCone(T, M.dir))
							M.add_to_mobs_hidden_atoms(src)
					Ts.show_footsteps(M, T, src)
				else
					if(src in M.client.hidden_mobs)
						M.client.hidden_mobs -= src
						for(var/image in M.client.hidden_atoms)
							var/image/I = image
							if(I.loc == src)
								I.override = FALSE
								M.client.hidden_atoms -= I
								M.client.images -= I
								QDEL_IN(I, 1 SECONDS)
								break

	update_blindspot_cone()

/mob/living/silicon/ai
	have_blindspot = FALSE

/mob/is_invisible_to(mob/viewer)
	return (!alpha || !mouse_opacity || viewer.see_invisible < invisibility || (viewer.client && (src in viewer.client.hidden_mobs)))
