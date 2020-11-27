#if !defined(USING_MAP_DATUM)

	// - Starlight Edit -
	#include "../../mods/dionaea/_dionaea.dme"

	#include "../../starlight/mods/booster/_booster.dme"
	#include "../../starlight/mods/tajaran/_tajaran.dme"
	#include "../../starlight/mods/tritonian/_tritonian.dme"
	#include "../../starlight/mods/blindspot/_blindspot.dme"

	#include "lowpop_jobs.dm"
	#include "lowpop_overrides.dm"
	#include "lowpop_areas.dm"
	#include "lowpop_setup.dm"
	#include "lowpop_shuttles.dm"
	#include "lowpop_unit_testing.dm"
	#include "lowpop_antagonists.dm"

	#include "lowpop-0.dmm"
	#include "lowpop-1.dmm"
	#include "lowpop-2.dmm"

	#define USING_MAP_DATUM /datum/map/lowpop

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Outpost Omega

#endif
