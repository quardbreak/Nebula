//Overmap object and shuttles

/obj/effect/overmap/visitable/ship/lowpop //It is ship for sensors
	name = "listening station"
	desc = "Sensors detect a small outpost."
	icon_state = "object"
	free_landing = TRUE
	known = 1
	initial_restricted_waypoints = list("Utility Shuttle" = list("nav_lowpop_dock"))

//Utility shuttle

/obj/effect/shuttle_landmark/lowpop_dock
	name = "Main Docking Port"
	landmark_tag = "nav_lowpop_dock"
	docking_controller = "utility_shuttle_dock"

/obj/machinery/computer/shuttle_control/explore/lowpop
	name = "utility shuttle computer"
	shuttle_tag = "Utility Shuttle"

/area/ship/lowpop_shuttle
	name = "Utility Shuttle"

/datum/shuttle/autodock/overmap/lowpop
	name = "Utility Shuttle"
	shuttle_area = /area/ship/lowpop_shuttle
	dock_target = "utility_shuttle"
	current_location = "nav_lowpop_dock"

/obj/effect/overmap/visitable/ship/landable/lowpop_shuttle
	name = "Utility Shuttle"
	shuttle = "Utility Shuttle"
	vessel_size = SHIP_SIZE_TINY