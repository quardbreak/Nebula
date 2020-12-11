/obj/item/music_tape
	name = "music tape"
	desc = "Magnetic tape adapted to outdated but proven music."
	icon = 'music_tape.dmi'
	icon_state = ICON_STATE_WORLD
	item_state = "analyzer"
	w_class = ITEM_SIZE_TINY
	force = 1
	throwforce = 0

	matter = list(/decl/material/solid/plastic = 20, /decl/material/solid/metal/steel = 5, /decl/material/solid/glass = 5)

	var/ruined = FALSE
	var/random_color = TRUE
	var/rewrites_left = 2
	var/datum/track/track
	var/uploader_ckey

/obj/item/music_tape/Initialize()
	. = ..()

	if(ispath(track, /music_track))
		track = pick(setup_music_tracks(track))

	if(random_color)
		color = get_random_colour()

	update_icon()

/obj/item/music_tape/on_update_icon()
	. = ..()
	overlays.Cut()
	overlays.Add(overlay_image(icon, "[icon_state]_overlay", flags = RESET_COLOR))
	if(ruined)
		overlays.Add(overlay_image(icon, "[icon_state]_ribbon", flags = RESET_COLOR))

/obj/item/music_tape/examine(mob/user)
	. = ..(user)
	if(track?.title)
		to_chat(user, SPAN_NOTICE("It's labeled as \"[track.title]\"."))

/obj/item/music_tape/attack_self(mob/user)
	if(!ruined)
		to_chat(user, SPAN_NOTICE("You pull out all the tape!"))
		ruin()

/obj/item/music_tape/attackby(obj/item/I, mob/user, params)
	if(ruined && (isScrewdriver(I) || istype(I, /obj/item/pen)))
		to_chat(user, SPAN_NOTICE("You start winding \the [src] back in..."))
		if(do_after(user, 120, target = src))
			to_chat(user, SPAN_NOTICE("You wound \the [src] back in."))
			fix()
		return

	if(istype(I, /obj/item/pen))
		if(loc == user && !user.incapacitated())
			var/new_name = input(user, "What would you like to label \the [src]?", "\improper [src] labeling", name) as null|text
			if(isnull(new_name) || new_name == name) return

			new_name = sanitizeSafe(new_name)

			if(new_name)
				to_chat(user, SPAN_NOTICE("You label \the [src] '[new_name]'."))
				track.title = "tape - \"[new_name]\""
			else
				to_chat(user, SPAN_NOTICE("You scratch off the label."))
				track.title = "tape - unknown"
		return
	..()

/obj/item/music_tape/fire_act()
	ruin()
	qdel(track)

/obj/item/music_tape/proc/CanPlay()
	if(!track)
		return FALSE

	if(ruined)
		return FALSE

	return TRUE

/obj/item/music_tape/proc/ruin()
	ruined = TRUE
	update_icon()

/obj/item/music_tape/proc/fix()
	ruined = FALSE
	update_icon()
