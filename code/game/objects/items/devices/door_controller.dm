#define REMOTE_OPEN "Open Door"
#define REMOTE_BOLT "Toggle Bolts"
#define REMOTE_ELECT "Electrify Door"

/obj/item/door_controller
	name = "remote door remote"
	desc = "A device which remotely controls airlocks."
	icon = 'icons/obj/door_controller.dmi'
	icon_state = ICON_STATE_WORLD

	w_class = ITEM_SIZE_TINY

	color = COLOR_WALL_GUNMETAL

	/// Color for stripe overlay.
	var/color_stripe = COLOR_ASSEMBLY_WHITE

	/// Region which this device has a remote access.
	var/region_access = ACCESS_REGION_NONE

	/// A selected mode between `Open Door`, `Toggle Bolts` and `Electrify Door`.
	var/mode = REMOTE_OPEN

	/// Emagging it will allow to perform `Electrify Door`.
	var/emagged = FALSE

	/// Is safety lock enabled / disabled.
	var/safety = TRUE

	/// Static list of beep sounds.
	var/static/list/beep_sounds = list(
		'sound/effects/compbeep1.ogg',
		'sound/effects/compbeep2.ogg',
		'sound/effects/compbeep3.ogg',
		'sound/effects/compbeep4.ogg',
		'sound/effects/compbeep5.ogg'
	)

/obj/item/door_controller/Initialize()
	. = ..()
	req_access = get_region_accesses(region_access)
	queue_icon_update()

/obj/item/door_controller/on_update_icon()
	. = ..()
	add_overlay(overlay_image(icon, "[icon_state]-stripe", color_stripe, RESET_COLOR))

/obj/item/door_controller/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/card/id))
		var/obj/item/card/id/id = I
		if(has_access(get_region_accesses(region_access), id.GetAccess()))
			safety = !safety
			to_chat(user, SPAN_NOTICE("You swipe your indefication card on \the [src]. The safety lock [safety ? "has been reset" : "off"] now."))
			playsound(src, pick(beep_sounds), 15, 1, 10)
		else
			to_chat(user, SPAN_DANGER("\The [src]'s screen displays a \"Authentication error\" message."))

	if(istype(I, /obj/item/card/emag) && !emagged)
		safety = FALSE
		emagged = TRUE

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

/obj/item/door_controller/attack_self(mob/user)
	if(mode == REMOTE_OPEN)
		if(emagged)
			mode = REMOTE_ELECT
		else
			mode = REMOTE_BOLT

	else if(mode == REMOTE_BOLT)
		mode = REMOTE_OPEN

	else if(mode == REMOTE_ELECT)
		mode = REMOTE_BOLT

	to_chat(user, "Now in mode: [mode].")

/obj/item/door_controller/afterattack(obj/machinery/door/airlock/D, mob/user)
	if(!istype(D) || safety || user.client.eye != user.client.mob)
		return

	if(!(D.arePowerSystemsOn()))
		to_chat(user, SPAN_DANGER("\The [D] has no power!"))
		return

	if(!D.requiresID())
		to_chat(user, SPAN_DANGER("\The [D]'s ID scan is disabled!"))
		return

	if(D.check_access(src) && D.canAIControl(user))
		playsound(src, pick(beep_sounds), 15, 1, 10)
		switch(mode)
			if(REMOTE_OPEN)
				if(D.density)
					D.open()
				else
					D.close()

			if(REMOTE_BOLT)
				if(D.locked)
					D.unlock()
				else
					D.lock()

			if(REMOTE_ELECT)
				if(D.electrified_until > 0)
					D.electrified_until = 0
				else
					D.electrified_until = 10
	else
		to_chat(user, SPAN_DANGER("\The [src] does not have access to this door."))

/obj/item/door_controller/omni
	name = "omni door remote"
	desc = "This remote control device can access to any door."
	color_stripe = COLOR_YELLOW
	safety = FALSE
	region_access = ACCESS_REGION_ALL

/obj/item/door_controller/command
	name = "command door remote"
	color_stripe = COLOR_YELLOW
	region_access = ACCESS_REGION_COMMAND

/obj/item/door_controller/engineering
	name = "engineering door remote"
	color_stripe = COLOR_ORANGE
	region_access = ACCESS_REGION_ENGINEERING

/obj/item/door_controller/research
	name = "research door remote"
	color_stripe = COLOR_PURPLE
	region_access = ACCESS_REGION_RESEARCH

/obj/item/door_controller/security
	name = "security door remote"
	color_stripe = COLOR_RED
	region_access = ACCESS_REGION_SECURITY

/obj/item/door_controller/supply
	name = "supply door remote"
	color_stripe = COLOR_GREEN
	region_access = ACCESS_REGION_SUPPLY

/obj/item/door_controller/medical
	name = "medical door remote"
	color_stripe = COLOR_BLUE
	region_access = ACCESS_REGION_MEDBAY

/obj/item/door_controller/civilian
	name = "civilian door remote"
	region_access = ACCESS_REGION_GENERAL

#undef REMOTE_OPEN
#undef REMOTE_BOLT
#undef REMOTE_ELECT
