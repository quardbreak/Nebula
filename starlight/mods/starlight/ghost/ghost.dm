/mob/ghostize(can_reenter_corpse = CORPSE_CAN_REENTER)
	// Are we the body of an aghosted admin? If so, don't make a ghost.
	if(teleop && istype(teleop, /mob/observer/ghost))
		var/mob/observer/ghost/G = teleop
		if(G.admin_ghosted)
			return
	if(key)
		hide_fullscreens()
		var/mob/observer/ghost/ghost = new(src)	//Transfer safety to observer spawning proc.
		ghost.can_reenter_corpse = can_reenter_corpse
		ghost.timeofdeath = src.stat == DEAD ? src.timeofdeath : world.time
		ghost.key = key
		if(!ghost.client?.holder)
			if(!config.antag_hud_allowed)
				ghost.verbs -= /mob/observer/ghost/verb/toggle_antagHUD	// Poor guys, don't know what they are missing!
			ghost.set_sight(sight & (~(SEE_TURFS|SEE_MOBS|SEE_OBJS)))
			ghost.add_client_color(/datum/client_color/noir)
		return ghost

/mob/living/ghost()
	set category = "OOC"
	set name = "Ghost"
	set desc = "Relinquish your life and enter the land of the dead."

	if(stat == DEAD)
		announce_ghost_joinleave(ghostize(1))
	else
		succumb()

/mob/observer/ghost/Login()
	..()
	if(ghost_image)
		ghost_image.filters = filter(type = "blur", size = 3)

/mob/observer/ghost/Logout()
	remove_client_color(/datum/client_color/noir)
	..()
