//Weapons

/datum/gear/weapons
	sort_category = "Weaponry"
	category = /datum/gear/weapons

/datum/gear/weapons/small
	display_name = "small energy pistol"
	path = /obj/item/gun/energy/gun/small
	cost = 2

/datum/gear/weapons/standard
	display_name = "energy pistol"
	path = /obj/item/gun/energy/gun
	cost = 3

/datum/gear/weapons/flash
	display_name = "flash"
	path = /obj/item/flash

//Armor

/datum/gear/tactical/armor
	display_name = "armor suit selection"
	path = /obj/item/clothing/suit
	slot = slot_wear_suit_str

/obj/item/clothing/suit/armor/pcarrier/filled
	starting_accessories = list(/obj/item/clothing/accessory/armorplate/medium,
								/obj/item/clothing/accessory/storage/pouches,
								/obj/item/clothing/accessory/armguards,
								/obj/item/clothing/accessory/legguards)

/datum/gear/tactical/armor/New()
	..()
	var/arms = list()
	arms["plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/filled
	arms["riot armor"] = /obj/item/clothing/suit/armor/riot
	arms["ballistic armor"] = /obj/item/clothing/suit/armor/bulletproof
	gear_tweaks += new/datum/gear_tweak/path(arms)

//Helmet

/datum/gear/tactical/helmet
	display_name = "helmet selection"
	path = /obj/item/clothing/head
	slot = slot_head_str

/datum/gear/tactical/helmet/New()
	..()
	var/helms = list()
	helms["helmet"] = /obj/item/clothing/head/helmet
	helms["riot helmet"] = /obj/item/clothing/head/helmet/riot
	helms["ballistic helmet"] = /obj/item/clothing/head/helmet/ballistic
	gear_tweaks += new/datum/gear_tweak/path(helms)

//Mask

/datum/gear/tactical/mask
	display_name = "gas mask selection"
	path = /obj/item/clothing/mask
	slot = slot_wear_mask_str

/datum/gear/tactical/mask/New()
	..()
	var/masks = list()
	masks["full mask"] = /obj/item/clothing/mask/gas
	masks["half mask"] = /obj/item/clothing/mask/gas/half
	masks["tactical mask"] = /obj/item/clothing/mask/gas/syndicate
	gear_tweaks += new/datum/gear_tweak/path(masks)

/datum/gear/tactical/holster
	cost = 1