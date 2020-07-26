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

/obj/machinery/media/jukebox/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/music_tape))
		var/obj/item/music_tape/D = W
		if(tape)
			to_chat(user, SPAN_NOTICE("There is already \a [tape] inside."))
			return

		if(D.ruined)
			to_chat(user, SPAN_WARNING("\The [D] is ruined, you can't use it."))
			return

		if(user.drop_item())
			visible_message(SPAN_NOTICE("[usr] insert \a [tape] into \the [src]."))
			D.forceMove(src)
			tape = D
			tracks.Insert(1, tape.track)
			verbs += .verb/eject
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

		tape = null
		visible_message(SPAN_NOTICE("[usr] eject \a [tape] from \the [src]."))
		verbs -= .verb/eject

