// Pre-made cassetes

/obj/item/music_tape/random
	random_color = TRUE

/obj/item/music_tape/random/Initialize()
	. = ..()
	track = pick(setup_music_tracks())

/obj/item/music_tape/custom/attack_self(mob/user)
	if(!ruined && !track)
		if(setup_tape(user))
			log_and_message_admins("uploaded new sound <a href='?_src_=holder;listen_tape_sound=\ref[track.GetTrack()]'>(preview)</a> in <a href='?_src_=holder;adminplayerobservefollow=\ref[src]'>\the [src]</a> with track name \"[track.title]\". <A HREF='?_src_=holder;wipe_tape_data=\ref[src]'>Wipe</A> data.")
		return
	..()

/obj/item/music_tape/custom/proc/setup_tape(mob/user)
	var/new_sound = input(user, "Select sound to upload. You should use only those audio formats which byond can accept. Ogg and module files is a good choice.", "Song Reminiscence: File") as null|sound
	if(isnull(new_sound))
		return FALSE

	var/new_name = input(user, "Name \the [src]:", "Song Reminiscence", "Untitled") as null|text
	if(isnull(new_name))
		return FALSE

	new_name = "tape - [sanitizeSafe(new_name)]"

	if(new_sound && new_name && !track)
		track = new /datum/track(new_name, new_sound)
		return TRUE
	return FALSE
