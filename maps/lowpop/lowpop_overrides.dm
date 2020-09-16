/world/New()
	..()
	game_year = (text2num(time2text(world.realtime, "YYYY")) + 56) //2076

//IDs are used only to recognize fellows, sorry.

/obj/machinery/Initialize()
	. = ..()
	initial_access = list()
	req_access = list()

//Trade console

/datum/computer_file/program/merchant/orbital
	required_access = null

/datum/computer_file/program/comm/orbital
	required_access = null

/obj/machinery/computer/modular/preset/merchant/orbital
	default_software = list(
		/datum/computer_file/program/merchant/orbital,
		/datum/computer_file/program/comm/orbital,
		/datum/computer_file/program/wordprocessor
	)