//Contains resomi-unique clothing, TODO: cloaks and stuff

/obj/item/clothing/under/resomi
	name = "small jumpsuit"
	desc = "A small jumpsuit. Looks pretty much perfect to fit a resomi."
	icon       = 'starlight/mods/species/resomi/icons/clothing/obj_under.dmi'
	icon_state = "jumpsuit"
	bodytype_restricted = list(BODYTYPE_RESOMI)
	sprite_sheets       = list(BODYTYPE_RESOMI = 'starlight/mods/species/resomi/icons/clothing/onmob_under.dmi')

/obj/item/clothing/under/resomi/simple
	name = "small smock"
	icon_state = "grey"

/obj/item/clothing/under/resomi/rainbow
	name = "rainbow smock"
	desc = "Why would someone wear this?"
	icon_state = "rainbow"

/obj/item/clothing/under/resomi/engine
	name = "small engineering smock"
	icon_state = "eng"

/obj/item/clothing/under/resomi/security
	name = "small security smock"
	icon_state = "sec"

/obj/item/clothing/under/resomi/medical
	name = "small medical smock"
	icon_state = "med"

/obj/item/clothing/under/resomi/science
	name = "small science smock"
	icon_state = "sci"

/obj/item/clothing/under/resomi/command
	name = "small command uniform"
	icon_state = "capt"

/obj/item/clothing/under/resomi/work
	name = "small work jumpsuit"
	icon_state = "work"
	var/glow_color = COLOR_WHITE

/obj/item/clothing/under/resomi/work/Initialize()
	glow_color = pick(COLOR_RED,COLOR_BLUE,COLOR_GREEN,COLOR_YELLOW,COLOR_ORANGE,COLOR_WHITE,COLOR_PURPLE,COLOR_CYAN)
	. = ..()

/obj/item/clothing/under/resomi/work/verb/glowchange(col as color)
	set name = "Change Glow Color"
	set category = "Object"
	set src in usr
	if(usr.incapacitated()) return
	glow_color = col
	to_chat(usr,"You change your [name] color to a <span style='color: [glow_color]'>a new one.</span>")
	update_clothing_icon()

/obj/item/clothing/under/resomi/work/get_mob_overlay(mob/user_mob, slot)
	. = ..()
	var/image/last = .
	if(slot == slot_w_uniform_str)
		var/image/I = image(sprite_sheets[BODYTYPE_RESOMI], "[icon_state]_overlay")
		I.color = glow_color
		I.layer = EYE_GLOW_LAYER
		I.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		last.overlays += I

//Shoes

/obj/item/clothing/shoes/resomi
	name = "small shoes"
	icon = 'starlight/mods/species/resomi/icons/clothing/exp/shoes.dmi'
	color = COLOR_GRAY
	bodytype_restricted = list(BODYTYPE_RESOMI)

//Spacesuits

/obj/item/clothing/under/resomi/space
	name       = "small pressure suit"
	desc       = "Thick rubber jumpsuit designed for work in vacuum of space."
	icon_state = "space"
	item_flags         = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = SLOT_UPPER_BODY | SLOT_LOWER_BODY | SLOT_LEGS | SLOT_FEET | SLOT_ARMS | SLOT_HANDS
	cold_protection    = SLOT_UPPER_BODY | SLOT_LOWER_BODY | SLOT_LEGS | SLOT_FEET | SLOT_ARMS | SLOT_HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection         = 0
	max_pressure_protection         = 303
	siemens_coefficient             = 0 //It's rubber, okay?
	var/obj/item/clothing/head/resomi_space/helmet
	action_button_name = "Toggle Helmet"

/obj/item/clothing/under/resomi/space/Initialize()
	. = ..()
	helmet = new()

/obj/item/clothing/under/resomi/space/Destroy()
	qdel(helmet)
	. = ..()

/obj/item/clothing/under/resomi/space/dropped()
	..()
	if(!ishuman(helmet.loc)) return
	var/mob/living/carbon/human/H = helmet.loc
	H.drop_from_inventory(helmet, src)
	playsound(loc,'sound/machines/airlock_heavy.ogg',30)

/obj/item/clothing/under/resomi/space/ui_action_click()
	toggle_helmet()

/obj/item/clothing/under/resomi/space/verb/toggle_helmet()
	set name = "Toggle Helmet"
	set category = "Object"
	set src in usr
	if(!ishuman(usr)) return
	var/mob/living/carbon/human/H = usr
	if(H.incapacitated())  return
	if(H.w_uniform != src) return
	if(H.head == helmet)
		playsound(loc,'sound/machines/airlock_heavy.ogg',     30)
		H.drop_from_inventory(helmet, src)
		return
	if(H.head)
		to_chat(H, SPAN_DANGER("You cannot deploy your helmet while wearing \the [H.head]."))
		return
	if(H.equip_to_slot_if_possible(helmet, slot_head_str))
		helmet.pickup(H)
		playsound(loc,'sound/machines/AirlockClose_heavy.ogg',30)

/obj/item/clothing/head/resomi_space
	name       = "small glass helmet"
	desc       = "Small glass dome made of durable glass alloy. It's wearer surely will have a spectacular view."
	icon       = 'starlight/mods/species/resomi/icons/clothing/obj_head.dmi'
	icon_state = "space_dome"
	bodytype_restricted = list(BODYTYPE_RESOMI)
	sprite_sheets       = list(BODYTYPE_RESOMI = 'starlight/mods/species/resomi/icons/clothing/onmob_head.dmi')
	item_flags          = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_AIRTIGHT
	flags_inv           = HIDEMASK | BLOCKHAIR
	body_parts_covered  = SLOT_HEAD|SLOT_FACE|SLOT_EYES
	cold_protection                 = SLOT_HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	min_pressure_protection         = 0
	max_pressure_protection         = 303
	canremove                       = 0

//Voidsuit

/obj/item/clothing/head/helmet/space/void/engineering/resomi
	name = "heavy resomi voidsuit helmet"
	icon = 'starlight/mods/species/resomi/icons/clothing/obj_head.dmi'
	icon_state = "heavy"

	bodytype_restricted = list(BODYTYPE_RESOMI)
	sprite_sheets       = list(BODYTYPE_RESOMI = 'starlight/mods/species/resomi/icons/clothing/onmob_head.dmi')

/obj/item/clothing/suit/space/void/engineering/resomi
	name = "heavy resomi voidsuit"
	icon = 'starlight/mods/species/resomi/icons/clothing/obj_suit.dmi'
	icon_state = "heavy"

	bodytype_restricted = list(BODYTYPE_RESOMI)
	sprite_sheets       = list(BODYTYPE_RESOMI = 'starlight/mods/species/resomi/icons/clothing/onmob_suit.dmi')

/obj/item/clothing/suit/space/void/engineering/resomi/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/engineering/resomi
	boots  = /obj/item/clothing/shoes/magboots

//Closet, for mapping

/obj/structure/closet/wardrobe/resomi
	name = "resomi equipment locker"
	closet_appearance = /decl/closet_appearance/wardrobe/green

/obj/structure/closet/wardrobe/resomi/Initialize()
	. = ..()
	new /obj/item/clothing/under/resomi/work(src)
	new /obj/item/clothing/under/resomi/work(src)
	new /obj/item/clothing/under/resomi/work(src)
	new /obj/item/clothing/under/resomi/work(src)
	new /obj/item/clothing/under/resomi/space(src)
	new /obj/item/clothing/under/resomi/space(src)
	new /obj/item/clothing/under/resomi/space(src)
	new /obj/item/clothing/under/resomi/space(src)
