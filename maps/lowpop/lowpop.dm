#if !defined(USING_MAP_DATUM)

	#define USING_MAP_DATUM /datum/map/lowpop

	#include "lowpop-0.dmm"
	#include "lowpop-1.dmm"
	#include "lowpop-2.dmm"

	#include "lowpop_jobs.dm"
	#include "lowpop_overrides.dm"
	#include "lowpop_areas.dm"
	#include "lowpop_setup.dm"
	#include "lowpop_shuttles.dm"
	#include "lowpop_unit_testing.dm"
	#include "lowpop_antagonists.dm"

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Outpost Omega

#endif
