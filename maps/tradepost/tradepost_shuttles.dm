/*
/obj/machinery/computer/shuttle_control/explore/tradepost
	name = "exploration shuttle console"
	shuttle_tag = "Exploration Shuttle"

/datum/shuttle/autodock/overmap/exploration
	name = "Exploration Shuttle"
	shuttle_area = /area/ship/trade/shuttle/outgoing
	dock_target = "tradepost_shuttle"
	current_location = "nav_tradepost_port_dock_shuttle"
*/

//navpts

/*
/obj/effect/shuttle_landmark/docking_arm_starboard
	name = "Tradepost Starboard-side Docking Arm"
	docking_controller = "tradepost_starboard_dock"

/obj/effect/shuttle_landmark/docking_arm_starboard/pod
	landmark_tag = "nav_tradepost_starboard_dock_pod"

/obj/effect/shuttle_landmark/docking_arm_port
	name = "Tradepost Port-side Docking Arm"
	docking_controller = "tradepost_dock_port"

/obj/effect/shuttle_landmark/docking_arm_port/shuttle
	landmark_tag = "nav_tradepost_port_dock_shuttle"
*/

/obj/effect/overmap/visitable/ship/tradepost
	initial_generic_waypoints = list()

	/*
	initial_restricted_waypoints = list(
		/datum/shuttle/autodock/overmap/exploration = list("nav_tradeship_port_dock_shuttle"),
	)
	*/

//Lifts

/obj/turbolift_map_holder/tradepost
	name = "tradepost elevator"
	door_type =  /obj/machinery/door/airlock/glass/freezer
	floor_type = /turf/simulated/floor/tiled/white
	wall_type = /turf/simulated/wall/r_wall
	firedoor_type = null
	light_type =  /obj/machinery/light/small
	button_type = /obj/structure/lift/button/standalone
	panel_type =  /obj/structure/lift/panel/standalone

/obj/turbolift_map_holder/tradepost/cargo
	door_type = null
	floor_type = /turf/simulated/floor/plating
	wall_type = null
	light_type = null

/*
	areas_to_use = list(
		/area/turbolift/tradepost_enclave,
		/area/turbolift/tradepost_cargo,
		/area/turbolift/tradepost_upper,
		/area/turbolift/tradepost_roof
	)
	floor_departure_sound = 'sound/effects/lift_heavy_start.ogg'
	floor_arrival_sound =   'sound/effects/lift_heavy_stop.ogg'
	depth = 4
	lift_size_x = 3
	lift_size_y = 3*/