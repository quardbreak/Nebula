// Thanks to Burger from Burgerstation for the foundation for this
var/global/list/floating_chat_colors = list()

/// How long the chat message's spawn-in animation will occur for
#define CM_SPAWN_TIME 0.2 SECONDS
/// How long the chat message will exist prior to any exponential decay
#define CM_LIFESPAN 5 SECONDS
/// How long the chat message's end of life fading animation will occur for
#define CM_EOL_FADE 0.7 SECONDS
/// Max width of chat message in pixels
#define CM_WIDTH 128
/// Max width of chat message in pixels
#define CM_HEIGHT 64
/// Max length of chat message in characters
#define CM_LENGTH 110
/// How much the message moves up before fading out.
#define CM_FADE_PIXEL_Y 10

/atom/movable
	var/list/stored_chat_text
	/// Last name used to calculate a color for the chatmessage overlays
	var/chat_color_name
	/// Last color calculated for the the chatmessage overlays
	var/chat_color
	/// A luminescence-shifted value of the last color calculated for chatmessage overlays
	var/chat_color_darkened

/atom/movable/proc/animate_chat(message, decl/language/language, list/extra_classes = list(), list/show_to, duration = CM_LIFESPAN)
	set waitfor = FALSE

	// Get rid of any URL schemes that might cause BYOND to automatically wrap something in an anchor tag
	var/static/regex/url_scheme = new(@"(https?|byond):\/\/", "gi")
	message = replacetext(message, url_scheme, "")

	// Remove spans in the message from things like the recorder
	message = strip_html_properly(message)

	// Reject whitespace
	var/static/regex/whitespace = new(@"^\s*$")
	if (whitespace.Find(message))
		return

	// Clip message
	if (length_char(message) > CM_LENGTH)
		message = copytext_char(message, 1, CM_LENGTH + 1) + "..." // BYOND index moment

	// Calculate target color if not already present
	if (!chat_color || chat_color_name != name)
		chat_color = colorize_string(name)
		chat_color_darkened = colorize_string(name, 0.85, 0.85)
		chat_color_name = name

	//additional style params for the message

	if(copytext_char(message, length_char(message) - 1) == "!!")
		if(copytext_char(message, -2) == "!!")
			extra_classes.Add("yell")

	// create 2 messages, one that appears if you know the language, and one that appears when you don't know the language
	var/image/understood = generate_floating_text(src, capitalize(message), extra_classes, duration, show_to)
	var/image/gibberish = language ? generate_floating_text(src, language.scramble(src, message), extra_classes, duration, show_to) : understood

	for(var/client/C in show_to)
		if(!(C.get_preference_value(/datum/client_preference/floating_messages) == PREF_SHOW))
			continue

		var/mob/M = C.mob
		if(M.see_invisible < invisibility)
			continue

		if(M.stat == UNCONSCIOUS)
			continue

		if(M.is_deaf())
			continue

		if(M.say_understands(src, language))
			C.images += understood
		else
			C.images += gibberish

/proc/generate_floating_text(atom/movable/holder, message, list/extra_classes, duration, show_to)
	var/message_loc = isturf(holder) ? holder : get_atom_on_turf(holder)

	var/bound_height = world.icon_size
	var/bound_width = world.icon_size

	if(ismovable(message_loc))
		var/atom/movable/AM = message_loc
		bound_height = AM.bound_height
		bound_width = AM.bound_width

	var/image/I = image(null, message_loc)
	I.plane = HUD_PLANE
	I.layer = HUD_ABOVE_ITEM_LAYER
	I.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
	I.alpha = 0
	I.pixel_z = bound_height - CM_FADE_PIXEL_Y
	I.pixel_w = (bound_width * 0.5) - (world.icon_size / 2)
	I.maptext_width = CM_WIDTH
	I.maptext_height = CM_HEIGHT
	I.maptext_x = (CM_WIDTH - bound_width) * -0.5

	animate(I, CM_SPAWN_TIME, alpha = 255, pixel_z = bound_height)

	for(var/image/old in holder.stored_chat_text)
		var/pixel_z_new = old.pixel_z + CM_FADE_PIXEL_Y
		animate(old, CM_SPAWN_TIME, pixel_z = pixel_z_new)

	LAZYADD(holder.stored_chat_text, I)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/remove_floating_text, holder, I), duration)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/remove_images_from_clients, I, show_to), duration + CM_EOL_FADE)
	events_repository.register(/decl/observ/destroyed, message_loc, I, /datum/proc/qdel_self)
	type_floating_text(holder, I, message, extra_classes)
	return I

/proc/remove_floating_text(atom/movable/holder, image/I)
	events_repository.unregister(/decl/observ/destroyed, I.loc, I, /datum/proc/qdel_self)
	animate(I, CM_EOL_FADE, pixel_z = I.pixel_z + CM_FADE_PIXEL_Y, alpha = 0, flags = ANIMATION_PARALLEL)
	LAZYREMOVE(holder.stored_chat_text, I)

/proc/type_floating_text(atom/movable/holder, image/I, message, list/extra_classes)
	set waitfor = FALSE

	// We dim italicized text to make it more distinguishable from regular text
	var/tgt_color = extra_classes.Find("italics") ? holder.chat_color_darkened : holder.chat_color

	for(var/i = 1 to length_char(message) + 1)
		I.maptext = MAPTEXT("<span class='center [extra_classes.Join(" ")]' style='color: [tgt_color]'>[copytext_char(message, 1, i)] </span>")
		sleep(0.5)

// Tweak these defines to change the available color ranges
#define CM_COLOR_SAT_MIN 0.6
#define CM_COLOR_SAT_MAX 0.7
#define CM_COLOR_LUM_MIN 0.65
#define CM_COLOR_LUM_MAX 0.75

/**
 * Gets a color for a name, will return the same color for a given string consistently within a round.atom
 *
 * Note that this proc aims to produce pastel-ish colors using the HSL colorspace. These seem to be favorable for displaying on the map.
 *
 * Arguments:
 * * name - The name to generate a color for
 * * sat_shift - A value between 0 and 1 that will be multiplied against the saturation
 * * lum_shift - A value between 0 and 1 that will be multiplied against the luminescence
 */
/proc/colorize_string(name, sat_shift = 1, lum_shift = 1)
	// seed to help randomness
	var/static/rseed = rand(1,26)

	// get hsl using the selected 6 characters of the md5 hash
	var/hash = copytext(md5(name + global.game_id), rseed, rseed + 6)
	var/h = hex2num(copytext(hash, 1, 3)) * (360 / 255)
	var/s = (BITSHIFT_RIGHT(hex2num(copytext(hash, 3, 5)), 2)) * ((CM_COLOR_SAT_MAX - CM_COLOR_SAT_MIN) / 63) + CM_COLOR_SAT_MIN
	var/l = (BITSHIFT_RIGHT(hex2num(copytext(hash, 5, 7)), 2)) * ((CM_COLOR_LUM_MAX - CM_COLOR_LUM_MIN) / 63) + CM_COLOR_LUM_MIN

	// adjust for shifts
	s *= clamp(sat_shift, 0, 1)
	l *= clamp(lum_shift, 0, 1)

	return hsl2rgb(h, s, l)

#undef CM_COLOR_SAT_MIN
#undef CM_COLOR_SAT_MAX
#undef CM_COLOR_LUM_MIN
#undef CM_COLOR_LUM_MAX

#undef CM_SPAWN_TIME
#undef CM_LIFESPAN
#undef CM_EOL_FADE
#undef CM_WIDTH
#undef CM_HEIGHT
#undef CM_LENGTH
#undef CM_FADE_PIXEL_Y
