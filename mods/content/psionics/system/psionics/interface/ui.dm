/atom/movable/screen/psi
	icon = 'mods/content/psionics/icons/psi.dmi'
	var/mob/living/owner
	var/hidden = TRUE

/atom/movable/screen/psi/Initialize(var/ml, var/mob/_owner)
	. = ..()
	owner = _owner
	loc = null
	update_icon()

/atom/movable/screen/psi/Destroy()
	if(owner && owner.client)
		owner.client.screen -= src
	. = ..()

/atom/movable/screen/psi/on_update_icon()
	if(hidden)
		invisibility = 101
	else
		invisibility = 0