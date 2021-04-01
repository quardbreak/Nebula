/obj/item/robot_module/standard
	name = "standard robot module"
	display_name = "Standard"
	sprites = list(
		"Basic" = "robot_old",
		"Android" = "droid",
		"Default" = "robot"
	)
	equipment = list(
		/obj/item/flash,
		/obj/item/extinguisher,
		/obj/item/wrench,
		/obj/item/crowbar,
		/obj/item/scanner/health
	)
	emag = /obj/item/energy_blade/sword
	skills = list(
		SKILL_LITERACY     = SKILL_TRAINED,
		SKILL_COMBAT       = SKILL_TRAINED,
		SKILL_MEDICAL      = SKILL_TRAINED,
		SKILL_CONSTRUCTION = SKILL_TRAINED
	)
