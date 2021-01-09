/datum/map/constellation
	name = "Constellation"
	full_name = "Tradeship Constellation"
	path = "constellation"
	ground_noun = "deck"

	station_levels = list(1, 2, 3, 4)
	contact_levels = list(1, 2, 3, 4)
	player_levels = list(1, 2, 3, 4)

	station_name  = "Tradeship Constellation"
	station_short = "Constellation"

	dock_name     = "FTS Capitalist's Rest"
	boss_name     = "FTU Merchant Navy"
	boss_short    = "Merchant Admiral"
	company_name  = "Legit Cargo Ltd."
	company_short = "LC"

	overmap_event_areas = 6
	use_overmap = 1
	num_exoplanets = 2
	planet_size = list(129,129)

	welcome_sound = 'sound/effects/cowboysting.ogg'

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

	radiation_detected_message = "High levels of radiation have been detected in proximity of the %STATION_NAME%. SHIELDED AREAS: Dormitories, Exploration Shuttle, Medical Bay, Cargo Hold, Brig, Elevator. Please move to a shielded area until the radiation has passed."

	evac_controller_type             = /datum/evacuation_controller/starship
	emergency_shuttle_leaving_dock   = "Attention all hands: the escape pods have been launched, maintaining burn for %ETA%."
	emergency_shuttle_called_message = "Attention all hands: emergency evacuation procedures are now in effect. Escape pods will launch in %ETA%"
	emergency_shuttle_recall_message = "Attention all hands: emergency evacuation sequence aborted. Return to normal operating conditions."

/datum/map/constellation/get_map_info()
	return "You're aboard the <b>[station_name],</b> a survey and mercantile vessel affiliated with the Free Trade Union. \
	No meaningful authorities can claim the planets and resources in this uncharted sector, so their exploitation is entirely up to you - mine, poach and deforest all you want."

/datum/map/constellation/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining
	SStrade.traders += new /datum/trader/books
