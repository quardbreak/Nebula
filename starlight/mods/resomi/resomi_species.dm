/datum/species/resomi
	name              = SPECIES_RESOMI
	name_plural       = "Resomii"
	description       = "A tiny creature prone to make RYAAAAAAAAAAAAAAAAAAAAAA."
	hidden_from_codex = FALSE

	sexybits_location = BP_GROIN
	min_age           = 15
	max_age           = 45

	spawn_flags       = SPECIES_CAN_JOIN
	appearance_flags  = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_A_SKIN_TONE | HAS_LIPS
	bump_flag         = MONKEY
	swap_flags        = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags        = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	icobase           = 'icons/body.dmi'
	deform            = 'icons/body.dmi'
	damage_overlays   = 'icons/damage_overlay.dmi'
	damage_mask       = 'icons/damage_mask.dmi'
	blood_mask        = 'icons/blood_mask.dmi'
	preview_icon      = 'icons/preview.dmi'
	husk_icon         = 'icons/husk.dmi'
	tail_icon = 'icons/tail.dmi'
	tail      = "tail"

	base_color        = "#001144"
	flesh_color       = "#5f7bb0"
	blood_color       = "#d514f7"

	darksight_range   = 7
	darksight_tint    = DARKTINT_GOOD
	flash_mod         = 2

	total_health      = 150
	slowdown          = -1.5
	brute_mod         = 1.4
	burn_mod          =  1.4
	metabolism_mod    = 2.0
	mob_size          = MOB_SIZE_SMALL
	holder_type       = /obj/item/holder/human/resomi

	blood_volume      = 280
	body_temperature  = 314.15

	unarmed_attacks   = list(
		/decl/natural_attack/bite/sharp,
		/decl/natural_attack/claws,
		/decl/natural_attack/punch,
		/decl/natural_attack/stomp/weak
		)
	move_trail        = /obj/effect/decal/cleanable/blood/tracks/paw

	cold_level_1      = 180
	cold_level_2      = 130
	cold_level_3      = 70
	heat_level_1      = 320
	heat_level_2      = 370
	heat_level_3      = 600

	heat_discomfort_level = 294
	heat_discomfort_strings = list(
		"Your feathers prickle in the heat.",
		"You feel uncomfortably warm.",
		)
	cold_discomfort_level = 200
	cold_discomfort_strings = list(
		"You can't feel your paws because of the cold.",
		"You feel sluggish and cold.",
		"Your feathers bristle against the cold.")

	descriptors = list(
		/datum/mob_descriptor/height = -8,
		/datum/mob_descriptor/build = -8
		)

	override_organ_types = list(BP_LIVER = /obj/item/organ/internal/liver/resomi,
								BP_KIDNEYS = /obj/item/organ/internal/kidneys/resomi,
								BP_EYES = /obj/item/organ/internal/eyes/resomi)

/datum/species/resomi/skills_from_age(age)
	switch(age)
		if(0 to 17)		. = -4
		if(18 to 25)	. = 0
		if(26 to 35)	. = 4
		else			. = 8

/datum/species/resomi/get_surgery_overlay_icon(var/mob/living/carbon/human/H)
	return 'icons/surgery.dmi'

/obj/item/holder/human/resomi
	w_class = ITEM_SIZE_NORMAL

/obj/item/organ/internal/kidneys/resomi
	parent_organ = BP_CHEST

/obj/item/organ/internal/liver/resomi
	parent_organ = BP_CHEST

/obj/item/organ/internal/eyes/resomi
	eye_icon = 'icons/eyes.dmi'
	icon_state = "eyes"