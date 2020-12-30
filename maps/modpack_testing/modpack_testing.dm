#if !defined(USING_MAP_DATUM)

	#include "modpack_testing_lobby.dm"
	#include "blank.dmm"

	#include "..\..\mods\content\corporate\_corporate.dme"
	#include "..\..\mods\content\government\_government.dme"
	#include "..\..\mods\content\mundane.dm"
	#include "..\..\mods\mobs\dionaea\_dionaea.dme"
	#include "..\..\mods\mobs\borers\_borers.dme"
	#include "..\..\mods\content\modern_earth\_modern_earth.dme"
	#include "..\..\mods\content\psionics\_psionics.dme"
	#include "..\..\mods\species\ascent\_ascent.dme"
	#include "..\..\mods\species\utility_frames\_utility_frames.dme"

	// General content mod
	#include "../../starlight/mods/starlight/_starlight.dme"

	// Species mods
	#include "../../starlight/mods/resomi/_resomi.dme"
	#include "../../starlight/mods/booster/_booster.dme"
	#include "../../starlight/mods/tajaran/_tajaran.dme"
	#include "../../starlight/mods/tritonian/_tritonian.dme"

	// Visual and audio mods
	#include "../../starlight/mods/europa_floors/_europa_floors.dme"
	#include "../../starlight/mods/interpost_sounds/_interpost_sounds.dme"

	#define USING_MAP_DATUM /datum/map/modpack_testing

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Modpack Testing

#endif
