var/global/datum/overmap_generator/overmap_generator

#define IS_OVERMAP_INITIALIZED (global.overmap_generator)

/proc/overmap_initialize()
	if(!global.using_map.use_overmap)
		return TRUE

	testing("Building overmap...")

	var/start = REALTIMEOFDAY

	global.overmap_generator = new global.using_map.overmap_generator_type()
	global.overmap_generator.build_overmap()

	var/time = (REALTIMEOFDAY - start) / 10

	testing("Overmap build completed within [time] second\s.")
	return TRUE
