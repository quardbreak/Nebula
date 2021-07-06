//Initializes relatively late in subsystem init order.
SUBSYSTEM_DEF(misc_late)
	name = "Late Initialization"
	init_order = SS_INIT_MISC_LATE
	flags = SS_NO_FIRE

	/// List of all maze generators to process
	var/list/obj/effect/mazegen/generator/maze_generators = list()

/datum/controller/subsystem/misc_late/Initialize()
	global.using_map.build_exoplanets()
	var/decl/asset_cache/asset_cache = GET_DECL(/decl/asset_cache)
	asset_cache.load()
	if(length(maze_generators))
		log_ss("maze", "Generating mazes...")
		for(var/i in maze_generators)
			var/obj/effect/mazegen/generator/MG = i
			MG.run_generator()
	. = ..()
