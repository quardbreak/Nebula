//its very difficult to adapt every piece of clothing to resomiis
//so for now it just adds sprite sheet for certain cloths after init

/decl/species/resomi
	bodytype = BODYTYPE_RESOMI

/decl/species/resomi/equip_survival_gear(var/mob/living/carbon/human/H,var/extendedtank = 1)
	. = ..()
	QDEL_NULL(H.shoes)
	H.equip_to_slot(new        /obj/item/clothing/shoes/resomi,      slot_shoes_str)    //since they cant wear hooman shoes
	H.equip_to_slot_or_del(new /obj/item/clothing/under/resomi/work, slot_w_uniform_str)

/decl/species/resomi/New()
	equip_adjust = list(
		slot_head_str = list(
			"[NORTH]" = list("x" = 1, "y" = -6),
			"[EAST]" =  list("x" = 0,  "y" = -6),
			"[WEST]" =  list("x" = 0,  "y" = -6),
			"[SOUTH]" = list("x" = 1,  "y" = -6)
		),
		slot_back_str = list(
			"[NORTH]" = list("x" = 0,  "y" = -5),
			"[EAST]" =  list("x" = 3,  "y" = -5),
			"[WEST]" =  list("x" = -3, "y" = -5),
			"[SOUTH]" = list("x" = 0,  "y" = -5)
		),
		slot_belt_str = list(
			"[NORTH]" = list("x" = 0,  "y" = -3),
			"[EAST]" =  list("x" = 2,  "y" = -3),
			"[WEST]" =  list("x" = -2, "y" = -3),
			"[SOUTH]" = list("x" = 0,  "y" = -3)
		),
		slot_l_hand_str = list(
			"[NORTH]" = list("x" = 0,  "y" = -3),
			"[EAST]" =  list("x" = 0,  "y" = -3),
			"[WEST]" =  list("x" = 0, "y" = -3),
			"[SOUTH]" = list("x" = 0, "y" = -3)
		),
		slot_r_hand_str = list(
			"[NORTH]" = list("x" = 0, "y" = -3),
			"[EAST]" =  list("x" = 0,  "y" = -3),
			"[WEST]" =  list("x" = 0, "y" = -3),
			"[SOUTH]" = list("x" = 0,  "y" = -3)
		),
		slot_wear_mask_str = list(
			"[NORTH]" = list("x" = 0,  "y" = -4),
			"[EAST]" =  list("x" = 2,  "y" = -4),
			"[WEST]" =  list("x" = -2, "y" = -4),
			"[SOUTH]" = list("x" = 0,  "y" = -4)
		)
	)
	..()

/obj/item
	on_mob_use_spritesheets = TRUE

/obj/item/clothing/Initialize()
	. = ..()
	LAZYINITLIST(bodytype_restricted)
	if((sprite_sheets ? sprite_sheets[BODYTYPE_RESOMI] : FALSE) && bodytype_restricted.len) bodytype_restricted += BODYTYPE_RESOMI

//Head, Glasses, Masks

/obj/item/clothing/head/Initialize()
	LAZYINITLIST(bodytype_restricted)
	if(bodytype_restricted.len) bodytype_restricted |= BODYTYPE_RESOMI
	. = ..()

/obj/item/clothing/glasses/Initialize()
	LAZYINITLIST(bodytype_restricted)
	if(bodytype_restricted.len) bodytype_restricted |= BODYTYPE_RESOMI
	. = ..()

/obj/item/clothing/mask/Initialize()
	LAZYINITLIST(bodytype_restricted)
	if(bodytype_restricted.len) bodytype_restricted |= BODYTYPE_RESOMI
	. = ..()

//COOOULD probably make a macro for this
//this looks very bad, though thats the only way to do it right (yes i can add some resomivars or smthng else but..)

//Shoes

/obj/item/clothing/shoes/magboots/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/magboots.dmi'
	. = ..()

/obj/item/clothing/shoes/galoshes/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/galoshes.dmi'
	. = ..()

//Gloves

/obj/item/clothing/gloves/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/gloves.dmi'
	. = ..()

//ID

/obj/item/card/id/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/id.dmi'
	. = ..()

//Glasses

/obj/item/clothing/glasses/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/onmob_eyes.dmi'
	. = ..()

//Masks

/obj/item/clothing/mask/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/onmob_mask.dmi'
	. = ..()

//Backpacks & tanks

/obj/item/storage/backpack/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/backpack.dmi'
	. = ..()

/obj/item/storage/backpack/satchel/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/backpack.dmi'
	. = ..()

/obj/item/tank/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/onmob_back.dmi'
	. = ..()

//Radsuits (theyre essential?)

/obj/item/clothing/head/radiation/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/rad_helm.dmi'
	. = ..()

/obj/item/clothing/suit/radiation/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/rad_suit.dmi'
	. = ..()

/obj/item/clothing/accessory/cloak/hide/Initialize()
	LAZYINITLIST(sprite_sheets)
	sprite_sheets[BODYTYPE_RESOMI] = 'starlight/mods/species/resomi/icons/clothing/exp/cloak_hide.dmi'
	. = ..()
