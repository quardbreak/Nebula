#if !defined(USING_MAP_DATUM)

// STARLIGHT MODS START

	// General content mod
	#include "../../starlight/mods/content/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/species/booster/_booster.dme"
	#include "../../starlight/mods/species/resomi/_resomi.dme"
	#include "../../starlight/mods/species/vatgrown/_vatgrown.dme"
	#include "../../mods/species/tajaran/_tajaran.dme"

//	#include "../../starlight/mods/content/europa_floors/_europa_floors.dme"

// STARLIGHT MODS END

	#include "../../mods/content/mundane.dm"
	#include "../../mods/content/corporate/_corporate.dme"
	#include "../../mods/species/utility_frames/_utility_frames.dme"
	#include "../../mods/mobs/dionaea/_dionaea.dme"
	#include "../../mods/content/psionics/_psionics.dme"

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
	#include "exodus_lobby.dm"
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
