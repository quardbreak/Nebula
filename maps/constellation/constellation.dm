#if !defined(USING_MAP_DATUM)

// STARLIGHT MODS START

	// General content mod
	#include "../../starlight/mods/content/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/species/booster/_booster.dme"
	#include "../../starlight/mods/species/resomi/_resomi.dme"
	#include "../../starlight/mods/species/vatgrown/_vatgrown.dme"

	#include "../../starlight/mods/species/tajaran/_tajaran.dme" //temp

// STARLIGHT MODS END

	#include "../antag_spawn/heist/heist.dm"

	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/mobs/dionaea/_dionaea.dme"

	#include "../random_ruins/exoplanet_ruins/playablecolony/playablecolony.dm"

	#include "../../mods/content/government/away_sites/icarus/icarus.dm"
	#include "../../mods/content/government/ruins/ec_old_crash/ec_old_crash.dm"
	#include "../../mods/content/corporate/away_sites/lar_maria/lar_maria.dm"
	#include "../../mods/species/ascent/away_sites/ascent/ascent.dm"

	#include "../away/bearcat/bearcat.dm"
	#include "../away/casino/casino.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/mining/mining.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/yacht/yacht.dm"

	#include "constellation_antagonists.dm"
	#include "constellation_areas.dm"
	#include "constellation_documents.dm"
	#include "constellation_jobs.dm"
	#include "constellation_loadouts.dm"
	#include "constellation_lobby.dm"
	#include "constellation_overmap.dm"
	#include "constellation_overrides.dm"
	#include "constellation_shuttles.dm"
	#include "constellation_spawnpoints.dm"
	#include "constellation_unit_testing.dm"
	#include "constellation-0.dmm"
	#include "constellation-1.dmm"
	#include "constellation-2.dmm"
	#include "constellation-3.dmm"

	#include "jobs/_jobs.dm"
	#include "jobs/command.dm"
	#include "jobs/engineering.dm"
	#include "jobs/medical.dm"
	#include "jobs/science.dm"
	#include "outfits/_outfits.dm"
	#include "outfits/command.dm"
	#include "outfits/engineering.dm"
	#include "outfits/medical.dm"
	#include "outfits/science.dm"

	#define USING_MAP_DATUM /datum/map/constellation

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Constellation

#endif
