#if !defined(USING_MAP_DATUM)

	#include "../../mods/corporate/_corporate.dme"
	#include "../../mods/ascent/_ascent.dme"
	#include "../../mods/dionaea/_dionaea.dme"

	// General content mod
	#include "../../starlight/mods/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/resomi/_resomi.dme"
	#include "../../starlight/mods/booster/_booster.dme"
	#include "../../starlight/mods/tajaran/_tajaran.dme"
	#include "../../starlight/mods/tritonian/_tritonian.dme"

	// Visual and audio mods
	#include "../../starlight/mods/blindspot/_blindspot.dme"
	#include "../../starlight/mods/interpost_sounds/_interpost_sounds.dme"

	#include "../../mods/government/away_sites/icarus/icarus.dm"
	#include "../../mods/government/ruins/ec_old_crash/ec_old_crash.dm"
	#include "../../mods/corporate/away_sites/lar_maria/lar_maria.dm"
	#include "../../mods/ascent/away_sites/ascent/ascent.dm"

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
