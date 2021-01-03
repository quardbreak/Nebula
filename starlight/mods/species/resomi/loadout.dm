/datum/gear/resomi
	sort_category = "Xenowear"
	whitelisted   = list(SPECIES_RESOMI)
	category      = /datum/gear/resomi
	slot = slot_w_uniform_str

//Uniforms

/datum/gear/resomi/uniform_selection
	display_name = "resomi uniform selection"
	path         = /obj/item/clothing/under/resomi

/datum/gear/resomi/uniform_selection/New()
	..()
	var/list/uniforms = list()
	uniforms["grey smock"]        = /obj/item/clothing/under/resomi/simple
	uniforms["rainbow smock"]     = /obj/item/clothing/under/resomi/rainbow
	uniforms["engineering smock"] = /obj/item/clothing/under/resomi/engine
	uniforms["medical smock"]     = /obj/item/clothing/under/resomi/medical
	uniforms["security smock"]    = /obj/item/clothing/under/resomi/security
	uniforms["science smock"]     = /obj/item/clothing/under/resomi/science
	uniforms["command uniform"]   = /obj/item/clothing/under/resomi/command
	uniforms["work uniform"]      = /obj/item/clothing/under/resomi/work
	gear_tweaks += new/datum/gear_tweak/path(uniforms)

/datum/gear/resomi/uniform_color
	display_name = "colorable resomi jumpsuit"
	path         = /obj/item/clothing/under/resomi
	flags        = GEAR_HAS_COLOR_SELECTION

/datum/gear/resomi/space
	display_name = "resomi pressure suit"
	path         = /obj/item/clothing/under/resomi/space
