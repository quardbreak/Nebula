/datum/map/lowpop
	name = "Outpost Omega"
	full_name = "Listening Outpost Omega"
	path = "lowpop"

	station_levels = list(1,2,3)
	contact_levels = list(1,2,3)
	player_levels = list(1,2,3)

	station_name  = "Listening Outpost Omega"
	station_short = "Outpost Omega"

	dock_name     = "UES-7"
	boss_name     = "UE Command"
	boss_short    = "UE Admiral"
	company_name  = "United Earth"
	company_short = "UE"

	overmap_event_areas = 5
	lobby_screens = list('lowpop-lobby.png')
	use_overmap = 1
	num_exoplanets = 2

	emergency_shuttle_leaving_dock = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."
	evac_controller_type = /datum/evacuation_controller/lifepods

	starting_money = 1000
	department_money = 0
	salary_modifier = 0.1

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. Ensure that all the data about it is recorded. Cut all EVA immediately."

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
