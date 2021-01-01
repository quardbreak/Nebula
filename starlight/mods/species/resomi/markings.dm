/datum/sprite_accessory/marking/resomi
	species_allowed = list(SPECIES_RESOMI)
	icon            = 'starlight/mods/species/resomi/icons/markings.dmi'

/datum/sprite_accessory/marking/resomi/feathers
	name       = "Feathers"
	icon_state = "feathers"
	body_parts = list(BP_R_HAND,BP_L_HAND,BP_R_FOOT,BP_L_FOOT)

/datum/sprite_accessory/marking/resomi/fluff
	name       = "Fluff"
	icon_state = "resomi_fluff"
	body_parts = list(BP_GROIN,BP_R_FOOT,BP_L_FOOT,BP_CHEST,BP_HEAD)

/datum/sprite_accessory/marking/resomi/sidefluff
	name       = "Fluff, Side"
	icon_state = "resomi_sf"
	body_parts = list(BP_CHEST,BP_R_HAND,BP_L_HAND,BP_R_FOOT,BP_L_FOOT)

/decl/species/resomi/handle_post_species_pref_set(var/datum/preferences/pref)
	if(!pref) return
	LAZYINITLIST(pref.body_markings)
	if(!pref.body_markings["Feathers"]) pref.body_markings["Feathers"] = "#8888cc"
