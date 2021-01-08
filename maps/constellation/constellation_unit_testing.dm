/datum/unit_test/station_wires_shall_be_connected
	exceptions = list(list(48, 54, 3, EAST))

/datum/map/constellation
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/trade/crew/hallway/port = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/crew/hallway/starboard = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/maintenance/hallway = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/maintenance/lower = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/escape_port = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/escape_star = NO_SCRUBBER|NO_VENT,
		/area/ship/trade/engineering/atmos = NO_SCRUBBER
	)

	area_coherency_test_subarea_count = list(
		/area/ship/trade/crew/hallway/port = 2)
