/datum/map/exodus
	name          = "Exodus"
	full_name     = "NSS Exodus"
	path          = "exodus"

	station_name  = "NSS Exodus"
	station_short = "Exodus"
	dock_name     = "NAS Crescent"
	boss_name     = "Central Command"
	boss_short    = "Centcomm"
	company_name  = "NanoTrasen"
	company_short = "NT"
	system_name   = "Nyx"

	station_levels = list(1,2)
	contact_levels = list(1,2)
	player_levels =  list(1,2)
	admin_levels =   list(3,4)

	evac_controller_type = /datum/evacuation_controller/shuttle

	shuttle_docked_message = "The public ferry to %dock_name% has docked with the station. It will depart in approximately %ETD%"
	shuttle_leaving_dock =   "The public ferry has left the station. Estimate %ETA% until the ferry docks at %dock_name%."
	shuttle_called_message = "A public ferry to %dock_name% has been scheduled. It will arrive in approximately %ETA%"
	shuttle_recall_message = "The scheduled ferry has been cancelled."

/datum/map/exodus/get_map_info()
	return "Welcome to Exodus Station, one of the largest remaining stopovers between the core worlds and the rim. Once a corporate science station called the Exodus, it has been recently refurbished and rezoned for civilian use. Enjoy your stay!"
