var/global/list/floor_light_cache = list()

/obj/machinery/floor_light
	name = "floor light"
	icon = 'icons/obj/machines/floor_light.dmi'
	icon_state = "base"
	desc = "A backlit floor panel."
	layer = ABOVE_TILE_LAYER
	anchored = FALSE
	use_power = POWER_USE_ACTIVE
	idle_power_usage = 2
	active_power_usage = 20
	power_channel = EQUIP
	matter = list(
		/decl/material/solid/metal/steel = MATTER_AMOUNT_PRIMARY,
		/decl/material/solid/glass = MATTER_AMOUNT_REINFORCEMENT
	)
	required_interaction_dexterity = DEXTERITY_SIMPLE_MACHINES

	var/default_light_power = 2
	var/default_light_range = 4
	var/light_intensity = "normal"

/obj/machinery/floor_light/anchored
	anchored = TRUE

/obj/machinery/floor_light/attackby(var/obj/item/W, var/mob/user)
	if(isScrewdriver(W))
		var/turf/T = get_turf(src)
		if(!T.is_plating())
			to_chat(user, "You can only attach \the [name] if the floor plating is removed.")
			return
		else
			anchored = !anchored
			update_layer()
			visible_message(SPAN_NOTICE("\The [user] has [anchored ? "attached" : "detached"] \the [src]."))
		if(use_power)
			update_use_power(POWER_USE_OFF)
		visible_message(SPAN_NOTICE("\The [user] has [anchored ? "attached" : "detached"] \the [src]."))
	else if(isWelder(W) && (stat & BROKEN))
		var/obj/item/weldingtool/WT = W
		if(!WT.remove_fuel(0, user))
			to_chat(user, SPAN_WARNING("\The [src] must be on to complete this task."))
			return
		playsound(src.loc, 'sound/items/Welder.ogg', 50, 1)
		if(!do_after(user, 20, src))
			return
		if(!src || !WT.isOn())
			return
		visible_message(SPAN_NOTICE("\The [user] has repaired \the [src]."))
		set_broken(FALSE)
	else if(isWrench(W))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
		to_chat(user, SPAN_NOTICE("You dismantle the floor light."))

		SSmaterials.create_object(/decl/material/solid/metal/steel, loc, 1)
		SSmaterials.create_object(/decl/material/solid/glass, loc, 1)

		qdel(src)
	else if(isMultitool(W))
		switch(alert("What would you like to change?",, "Color", "Intensity", "Cancel"))
			if("Color")
				var/selected_light_color = input(user, "Choose your floor light's color:") as color
				if(CanPhysicallyInteract(user) && selected_light_color)
					light_color = selected_light_color
					visible_message(SPAN_NOTICE("\The [user] changed \the [src]'s color."))
					playsound(src, "button", 50, 1)
					update_light()
					update_icon()
			if("Intensity")
				var/selected_intensity = alert("Choose your floor light's intensity", "Intensity Change", "Slow", "Normal", "Fast")
				if(CanPhysicallyInteract(user) && selected_intensity)
					light_intensity = lowertext(selected_intensity)
					visible_message(SPAN_NOTICE("\The [user] changed \the [src]'s intensity to [light_intensity]."))
					playsound(src, "button", 50, 1)
					update_icon()
	else if(W.force && user.a_intent == I_HURT)
		attack_hand(user)
	return

/obj/machinery/floor_light/physical_attack_hand(var/mob/user)
	if(user.a_intent == I_HURT && !issmall(user))
		if(!(stat & BROKEN))
			visible_message(SPAN_DANGER("\The [user] smashes \the [src]!"))
			playsound(src, "shatter", 70, 1)
			set_broken(TRUE)
		else
			visible_message(SPAN_DANGER("\The [user] attacks \the [src]!"))
			playsound(src, 'sound/effects/Glasshit.ogg', 75, 1)
		return TRUE

/obj/machinery/floor_light/interface_interact(var/mob/user)
	if(!CanInteract(user, DefaultTopicState()))
		return FALSE

	if(!anchored)
		to_chat(user, SPAN_WARNING("\The [src] must be screwed down first."))
		return TRUE

	playsound(src, "switch", 75, 1)
	var/on = (use_power == POWER_USE_ACTIVE)
	update_use_power(on ? POWER_USE_OFF : POWER_USE_ACTIVE)
	visible_message(SPAN_NOTICE("\The [user] turns \the [src] [!on ? "on" : "off"]."))
	return TRUE

/obj/machinery/floor_light/set_broken(new_state)
	. = ..()
	if(. && (stat & BROKEN))
		update_use_power(POWER_USE_OFF)

/obj/machinery/floor_light/power_change(new_state)
	. = ..()
	if(. && (stat & NOPOWER))
		update_use_power(POWER_USE_OFF)

/obj/machinery/floor_light/proc/update_layer()
	for(var/obj/O in src)
		O.hide(O.hides_under_flooring() && anchored)

	if(anchored)
		layer = TURF_LAYER
	else
		layer = ABOVE_TILE_LAYER

/obj/machinery/floor_light/proc/update_brightness()
	if((use_power == POWER_USE_ACTIVE) && !(stat & (NOPOWER | BROKEN)))
		if(light_range != default_light_range || light_power != default_light_power)
			set_light(default_light_range, default_light_power, light_color)
	else
		if(light_range || light_power)
			set_light(0)
	
	change_power_consumption((light_range + light_power) * 20, POWER_USE_ACTIVE)

/obj/machinery/floor_light/on_update_icon()
	overlays.Cut()
	if((use_power == POWER_USE_ACTIVE) && !(stat & (NOPOWER | BROKEN)))
		var/cache_key = "floorlight-[light_color]-[light_intensity]"
		if(!floor_light_cache[cache_key])
			var/image/I = image("on_[light_intensity]")
			I.color = light_color
			I.plane = plane
			I.layer = layer + 0.001
			floor_light_cache[cache_key] = I
		add_overlay(floor_light_cache[cache_key])

	update_brightness()

/obj/machinery/floor_light/explosion_act(severity)
	. = ..()
	if(. && !QDELETED(src))
		if(severity == 1 || (severity == 2 && prob(50)) || (severity == 3 && prob(5)))
			physically_destroyed()
		else
			if(severity == 2 && prob(20))
				set_broken(TRUE)
