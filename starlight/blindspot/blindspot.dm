/////////////VISION CONE///////////////
//Vision cone code by, originally by Matt and Honkertron, rewritten by Chaoko99. This vision cone code allows for mobs and/or items to blocked out from a players field of vision.
//It makes use of planes and alpha masks only possible in 513 and above. Please see human_alt.dm and hud_alt.dm in the hud folder for more info on how this works.
///////////////////////////////////////

//"Made specially for Otuska"
// - Honker


// And now a note from Chaoko99 on what he did to the old vision cone code:
// "Kinda ripped all this out. Made a big fucking mess of the place, but this is overall cheaper. Probably breaks shit too.
// Refer to some earlier revision or interbay 2.0 for the original code."
// ~Chaoko99

/mob/living
	var/obj/screen/blindspot_overlay = null
	var/obj/screen/blindspot_mask = null
	var/have_blindspot = TRUE

/mob/living/proc/initialize_blindspot_cone()
	if(isliving(src))

		blindspot_overlay = new /obj/screen()
		blindspot_overlay.icon = 'hide.dmi'
		blindspot_overlay.icon_state = "combat"
		blindspot_overlay.name = " "
		blindspot_overlay.screen_loc = "1,1"
		blindspot_overlay.mouse_opacity = FALSE
		blindspot_overlay.plane = BLINDSPOT_CONE_PLANE

		blindspot_mask = new /obj/screen()
		blindspot_mask.icon = 'hide.dmi'
		blindspot_mask.icon_state = "combat_mask"
		blindspot_mask.name = " "
		blindspot_mask.screen_loc = "1,1"
		blindspot_mask.mouse_opacity = FALSE
		blindspot_mask.plane = HIDDEN_SHIT_PLANE

	update_blindspot_cone()

/mob/living/proc/initialize_filter_effects()
	if(!client)
		return

	var/obj/screen/plane_master/blindspot_target/BS = new //ALWAYS DEFINE THIS, WEIRD SHIT HAPPENS OTHERWISE
	var/obj/screen/plane_master/blindspot/primary/mob = new//creating new masters to remove things from vision.
	var/obj/screen/plane_master/blindspot/primary/lyingmob = new//ditto
	var/obj/screen/plane_master/blindspot/primary/human = new//ditto
	var/obj/screen/plane_master/blindspot/primary/lyinghuman = new//ditto
	var/obj/screen/plane_master/blindspot/inverted/footsteps = new//This master specifically makes it so the footstep stuff ONLY appears where it can't be seen.

	//define what planes the masters dictate.
	mob.plane = MOB_PLANE
	lyingmob.plane = LYING_MOB_PLANE
	human.plane = HUMAN_PLANE
	lyinghuma.plane = LYING_HUMAN_PLANE
	footsteps.plane = FOOTSTEP_ALERT_PLANE

	client.screen |= BS // Is this necessary? Yes.
	client.screen |= mob
	client.screen |= lyingmob
	client.screen |= human
	client.screen |= lyinghuman
	client.screen |= footsteps

/mob/living/proc/update_blindspot_cone()
	if(!client) //This doesn't actually hide shit from clientless mobs, so just keep them from running this.
		return

	check_blindspot()
	blindspot_overlay.dir = dir
	blindspot_mask.dir = dir

	client.screen |= blindspot_overlay
	client.screen |= blindspot_mask

/mob/living/proc/SetBlindspot(show)
	show ? show_blindspot_cone() : hide_blindspot_cone()

/mob/living/proc/check_blindspot()
	if(!client)
		return

	if(resting || lying || (client && client.eye != client.mob))
		blindspot_overlay.alpha = 0
		blindspot_mask.alpha = 0
		return

	else have_blindspot ? show_blindspot_cone() : hide_blindspot_cone()

//Making these generic procs so you can call them anywhere.
/mob/living/proc/show_blindspot_cone()
	if(blindspot_overlay)
		blindspot_overlay.alpha = 255
		blindspot_mask.alpha = 255
		have_blindspot = TRUE

/mob/living/proc/hide_blindspot_cone()
	if(blindspot_overlay)
		blindspot_overlay.alpha = 0
		blindspot_mask.alpha = 0
		have_blindspot = FALSE
