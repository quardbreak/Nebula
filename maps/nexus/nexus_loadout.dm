/decl/loadout_category/weapon
	name = "Weapon"

/decl/loadout_option/weapon
	category = /decl/loadout_category/weapon
	abstract_type = /decl/loadout_option/weapon

/decl/loadout_option/weapon/sidearm
	name = "sidearm selection"
	cost = 4
	path = /obj/item/gun

/decl/loadout_option/weapon/sidearm/get_gear_tweak_options()
	. = ..()
	LAZYINITLIST(.[/datum/gear_tweak/path])
	.[/datum/gear_tweak/path] |= list(
		"pistol, random" = /obj/item/gun/projectile/pistol/random,
		"revolver, weak" = /obj/item/gun/projectile/revolver/weak
	)

/decl/loadout_option/weapon/ammo
	name = "weak revolver ammo"
	cost = 2
	path = /obj/item/ammo_magazine/speedloader/weak
