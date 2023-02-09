var/global/list/latejoin_cryo = list()
/obj/abstract/landmark/latejoin/cryo/add_loc()
	global.latejoin_cryo |= get_turf(src)

var/global/list/latejoin_cryo_aux = list()
/obj/abstract/landmark/latejoin/cryo_aux/add_loc()
	global.latejoin_cryo_aux |= get_turf(src)

var/global/list/latejoin_cryo_captain = list()
/obj/abstract/landmark/latejoin/cryo_captain/add_loc()
	global.latejoin_cryo_captain |= get_turf(src)

/datum/map/tradepost
	allowed_spawns = list(
		/decl/spawnpoint/cryo,
		/decl/spawnpoint/cryo/aux,
		/decl/spawnpoint/cryo/captain
	)
	default_spawn = /decl/spawnpoint/cryo

/decl/spawnpoint/cryo
	name = "Cryogenic Storage"
	msg = "has completed revival in the primary cryogenics bay"

/decl/spawnpoint/cryo/Initialize()
	. = ..()
	turfs = global.latejoin_cryo

/decl/spawnpoint/cryo/aux
	name = "Auxiliary Cryogenic Storage"
	msg = "has completed revival in the auxiliary cryogenics bay"

/decl/spawnpoint/cryo/aux/Initialize()
	. = ..()
	turfs = global.latejoin_cryo_aux

/decl/spawnpoint/cryo/captain
	name = "Captain Compartment"
	msg = "has completed revival in the captain compartment"
	restrict_job = list(/datum/job/tradepost_captain)

/decl/spawnpoint/cryo/captain/Initialize()
	. = ..()
	turfs = global.latejoin_cryo_captain
