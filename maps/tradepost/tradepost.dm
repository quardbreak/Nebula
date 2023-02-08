#if !defined(USING_MAP_DATUM)

	#include "../../mods/content/bigpharma/_bigpharma.dme"
	#include "../../mods/content/scaling_descriptors.dm"

	#include "../../mods/species/utility_frames/_utility_frames.dme"

	#include "tradepost_antagonists.dm"
	#include "tradepost_areas.dm"
	#include "tradepost_departments.dm"
	#include "tradepost_guns.dm"
	#include "tradepost_jobs.dm"
	#include "tradepost_loadouts.dm"
	#include "tradepost_overmap.dm"
	#include "tradepost_spawnpoints.dm"
	#include "tradepost_overrides.dm"
	#include "tradepost_shuttles.dm"
	#include "tradepost_unit_testing.dm"

	#include "outfits/_outfits.dm"
	#include "outfits/command.dm"
	#include "outfits/engineering.dm"
	#include "outfits/medical.dm"
	#include "outfits/security.dm"

	#include "jobs/_jobs.dm"
	#include "jobs/civilian.dm"
	#include "jobs/command.dm"
	#include "jobs/engineering.dm"
	#include "jobs/medical.dm"
	#include "jobs/security.dm"

	#include "tradepost-1.dmm"
	#include "tradepost-2.dmm"
//	#include "tradepost-3.dmm"

	#define USING_MAP_DATUM /datum/map/tradepost

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tradepost

#endif
