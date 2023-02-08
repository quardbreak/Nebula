/decl/loadout_option/utility/guns
	name = "guns"
	cost = 4
	path = /obj/item/gun/projectile

/decl/loadout_option/utility/guns/Initialize()
	. = ..()
	var/guns = list()
	guns["weak revolver"] = /obj/item/gun/projectile/revolver/weak
	gear_tweaks += new/datum/gear_tweak/path(guns)

/decl/loadout_option/utility/ammo
	name = "weak revolver ammo"
	cost = 2
	path = /obj/item/ammo_magazine/speedloader/weak