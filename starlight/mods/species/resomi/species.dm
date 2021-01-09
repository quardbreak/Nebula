/decl/species/resomi
	name              = SPECIES_RESOMI
	name_plural       = "Resomii"
	description       = "A tiny birdy creature."
	hidden_from_codex = FALSE

	sexybits_location = BP_GROIN
	min_age           = 15
	max_age           = 45

	spawn_flags       = SPECIES_CAN_JOIN
	appearance_flags  = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_EYE_COLOR | HAS_A_SKIN_TONE | HAS_LIPS
	bump_flag         = MONKEY
	swap_flags        = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags        = MONKEY|SLIME|SIMPLE_ANIMAL|ALIEN

	icobase           = 'starlight/mods/species/resomi/icons/body.dmi'
	deform            = 'starlight/mods/species/resomi/icons/body.dmi'
	damage_overlays   = 'starlight/mods/species/resomi/icons/damage_overlay.dmi'
	damage_mask       = 'starlight/mods/species/resomi/icons/damage_mask.dmi'
	blood_mask        = 'starlight/mods/species/resomi/icons/blood_mask.dmi'
	preview_icon      = 'starlight/mods/species/resomi/icons/preview.dmi'
	husk_icon         = 'starlight/mods/species/resomi/icons/husk.dmi'
	tail_icon         = 'starlight/mods/species/resomi/icons/tail.dmi'
	tail              = "tail"
	tail_hair         = "feathers_s"

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
	breath_pressure   = 8

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
		"Your feathers bristle against the cold."
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/resomi_sonar_ping,
		/mob/living/proc/toggle_pass_table
	)

	descriptors = list(
		/datum/mob_descriptor/height = -8,
		/datum/mob_descriptor/build = -8
	)

	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
	)

	override_organ_types = list(
		BP_EYES = /obj/item/organ/internal/eyes/resomi
	)

/decl/species/resomi/skills_from_age(age)
	switch(age)
		if(0 to 17)  . = -4
		if(18 to 25) . = 0
		if(26 to 35) . = 4
		else		 . = 8

/decl/species/resomi/get_surgery_overlay_icon(var/mob/living/carbon/human/H)
	return 'starlight/mods/species/resomi/icons/surgery.dmi'

/obj/item/holder/human/resomi
	icon = 'starlight/mods/species/resomi/icons/holder.dmi'
	w_class = ITEM_SIZE_LARGE

/obj/item/organ/internal/eyes/resomi
	eye_icon = 'starlight/mods/species/resomi/icons/eyes.dmi'
	icon_state = "eyes"
