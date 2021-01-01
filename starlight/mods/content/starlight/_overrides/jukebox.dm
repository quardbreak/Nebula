/obj/machinery/media/jukebox
	var/obj/item/music_tape/tape

/obj/machinery/media/jukebox/Destroy()
	QDEL_NULL(tape)
	. = ..()

/obj/machinery/media/jukebox/OnTopic(mob/user, list/href_list, state)
	. = ..()
	if(href_list["eject"])
		eject()
		return TOPIC_REFRESH

/obj/machinery/media/jukebox/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1)
	var/list/juke_tracks = new
	for(var/datum/track/T in tracks)
		juke_tracks.Add(list(list("track"=T.title)))

	var/list/data = list(
		"current_track" = current_track != null ? current_track.title : "No track selected",
		"playing" = playing,
		"tracks" = juke_tracks,
		"volume" = volume,
		"tape" = tape
	)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "jukebox.tmpl", "Your Media Library", 340, 440)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/media/jukebox/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/music_tape))
		var/obj/item/music_tape/D = W
		if(tape)
			to_chat(user, SPAN_NOTICE("There is already \a [tape] inside."))
			return

		if(D.ruined)
			to_chat(user, SPAN_WARNING("\The [D] is ruined, you can't use it."))
			return

		if(user.unEquip(D, src))
			tape = D
			visible_message(SPAN_NOTICE("[usr] insert \a [tape] into \the [src]."))
			tracks.Insert(1, tape.track)
			verbs |= .verb/eject
		return
	return ..()

/obj/machinery/media/jukebox/verb/eject()
	set name = "Eject"
	set category = "Object"
	set src in oview(1)

	if(!CanPhysicallyInteract(usr))
		return

	if(tape)
		StopPlaying()
		current_track = null
		for(var/datum/track/T in tracks)
			if(T == tape.track)
				tracks -= T

		if(!usr.put_in_hands(tape))
			tape.dropInto(loc)

		visible_message(SPAN_NOTICE("[usr] eject \a [tape] from \the [src]."))
		tape = null
		verbs -= .verb/eject
