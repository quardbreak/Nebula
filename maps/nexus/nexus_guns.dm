/obj/item/gun/projectile/revolver/weak
	name = "factory revolver"
	desc = "A cheap unwieldy low-caliber sidearm commonly found on space frontier denizens and dem cowboys. Uses a plain 7mm holdout bullets."
	icon = 'maps/tradepost/weak_revolver.dmi'
	caliber = CALIBER_PISTOL_SMALL
	ammo_type = /obj/item/ammo_casing/pistol/small
	safety_icon = null
	max_shells = 10
	fire_delay = 20
	bulk = 1
	one_hand_penalty = 2
	accuracy = 0
	origin_tech = "{'combat':1,'materials':1}"

/obj/item/gun/projectile/revolver/weak/fabricator
	starts_loaded = FALSE

/obj/item/ammo_magazine/speedloader/weak
	icon = 'maps/tradepost/weak_speedloader.dmi'
	caliber = CALIBER_PISTOL_SMALL
	ammo_type = /obj/item/ammo_casing/pistol/small
	max_ammo = 10

/obj/item/ammo_magazine/speedloader/weak/get_bullet_offsets(index)
	var/static/list/bullet_offsets = list(
		list("x" =  0, "y" = 0),
		list("x" = -2, "y" = -1),
		list("x" = -3, "y" = -3),
		list("x" = -3, "y" = -6),
		list("x" = -2, "y" = -8),
		list("x" =  0, "y" = -9),
		list("x" =  2, "y" = -8),
		list("x" =  3, "y" = -6),
		list("x" =  3, "y" = -3),
		list("x" =  2, "y" = -1)
	)
	return bullet_offsets[index]

/datum/fabricator_recipe/arms_ammo/hidden/speedloader_small
	name = "ammunition (speedloader, holdout)"
	path = /obj/item/ammo_magazine/speedloader/weak
