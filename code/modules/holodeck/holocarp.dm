/mob/living/simple_animal/hostile/carp/holo
	icon = 'icons/mob/simple_animal/holocarp.dmi'
	alpha = 127
	meat_amount = 0
	meat_type = null
	destroy_surroundings = TRUE

/mob/living/simple_animal/hostile/carp/holo/carp_randomify()
	return

/mob/living/simple_animal/hostile/carp/holo/on_update_icon()
	SHOULD_CALL_PARENT(FALSE)
	return

/mob/living/simple_animal/hostile/carp/holo/Initialize()
	. = ..()
	set_light(2) //hologram lighting

/mob/living/simple_animal/hostile/carp/holo/proc/set_safety(safe)
	if (safe)
		faction = MOB_FACTION_NEUTRAL
		natural_weapon.force = 0
		destroy_surroundings = FALSE
	else
		faction = initial(faction)
		natural_weapon.force = initial(natural_weapon.force)
		destroy_surroundings = TRUE

/mob/living/simple_animal/hostile/carp/holo/gib()
	death()

/mob/living/simple_animal/hostile/carp/holo/death()
	..(null, "fades away!", "You have been destroyed.")
	qdel(src)
