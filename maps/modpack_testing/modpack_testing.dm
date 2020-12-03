#if !defined(USING_MAP_DATUM)

	#include "modpack_testing_lobby.dm"
	#include "blank.dmm"

	#include "..\..\mods\misc\mundane.dm"
	#include "..\..\mods\corporate\_corporate.dme"
	#include "..\..\mods\government\_government.dme"
	#include "..\..\mods\psionics\_psionics.dme"
	#include "..\..\mods\borers\_borers.dme"
	#include "..\..\mods\ascent\_ascent.dme"
	#include "..\..\mods\modern_earth\_modern_earth.dme"
	#include "..\..\mods\dionaea\_dionaea.dme"

	// - Starlight Edit -
	#include "../../starlight/mods/resomi/_resomi.dme"
	#include "../../starlight/mods/booster/_booster.dme"
	#include "../../starlight/mods/tajaran/_tajaran.dme"
	#include "../../starlight/mods/tritonian/_tritonian.dme"
	#include "../../starlight/mods/blindspot/_blindspot.dme"
	#include "../../starlight/mods/europa_floors/_europa_floors.dme"
	#include "../../starlight/mods/interpost_sounds/_interpost_sounds.dme"

	#define USING_MAP_DATUM /datum/map/modpack_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Modpack Testing

#endif
