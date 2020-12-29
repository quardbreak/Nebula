GLOBAL_LIST_EMPTY(prefs_fixed)

/client/verb/fix_preferences()
	set name = "Fix Characters Load"
	set category = "OOC"

	if(ckey in GLOB.prefs_fixed)
		to_chat(usr, SPAN_NOTICE("Your characters should have already loaded. If this does not happen, please inform the developers."))
		return

	GLOB.prefs_fixed |= ckey

	prefs.load_path(ckey)
	prefs.load_preferences()
	prefs.load_and_update_character()
	prefs.sanitize_preferences()
