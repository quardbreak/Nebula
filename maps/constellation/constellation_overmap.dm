/obj/effect/overmap/visitable/ship/constellation
	name = "Tradeship Constellation Alpha"
	color = "#00ffff"
	vessel_mass = 2800
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

	initial_generic_waypoints = list("nav_constellation_below_bow", "nav_constellation_below_starboardastern", "nav_constellation_port_dock_shuttle")
	initial_restricted_waypoints = list(
		"Exploration Pod" = list("nav_constellation_starboard_dock_pod"), //pod can only dock starboard-side, b/c there's only one door.
	)