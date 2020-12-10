#if !defined(USING_MAP_DATUM)

	#include "../../mods/misc/mundane.dm"
	#include "../../mods/corporate/_corporate.dme"
	#include "../../mods/ascent/_ascent.dme"
	#include "../../mods/psionics/_psionics.dme"
	#include "../../mods/dionaea/_dionaea.dme"

	// Species mods
	#include "../../starlight/mods/resomi/_resomi.dme"
	#include "../../starlight/mods/booster/_booster.dme"
	#include "../../starlight/mods/tajaran/_tajaran.dme"
	#include "../../starlight/mods/tritonian/_tritonian.dme"

	// Visual and audio mods
//	#include "../../starlight/mods/blindspot/_blindspot.dme"
	#include "../../starlight/mods/europa_floors/_europa_floors.dme"

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

	#include "jobs/captain.dm"
	#include "jobs/civilian.dm"
	#include "jobs/engineering.dm"
	#include "jobs/medical.dm"
	#include "jobs/science.dm"
	#include "jobs/security.dm"

	#include "outfits/_pda.dm"
	#include "outfits/cargo.dm"
	#include "outfits/civilian.dm"
	#include "outfits/command.dm"
	#include "outfits/engineering.dm"
	#include "outfits/medical.dm"
	#include "outfits/science.dm"
	#include "outfits/security.dm"

	#include "exodus_announcements.dm"
	#include "exodus_antagonism.dm"
	#include "exodus_areas.dm"
	#include "exodus_elevator.dm"
	#include "exodus_jobs.dm"
	#include "exodus_loadout.dm"
	#include "exodus_overmap.dm"
	#include "exodus_setup.dm"
	#include "exodus_shuttles.dm"
	#include "exodus_unit_testing.dm"

	#include "exodus-1.dmm"
	#include "exodus-2.dmm"
	#include "exodus-transit.dmm"

	#define USING_MAP_DATUM /datum/map/exodus

#elif !defined(MAP_OVERRIDE)
	#warn A map has already been included, ignoring Exodus
#endif
