/datum/species/machine
	name = SPECIES_IPC
	name_plural = "machines"

	description = "Positronic intelligence really took off in the 26th century, and it is not uncommon to see independant, free-willed \
	robots on many human stations, particularly in fringe systems where standards are slightly lax and public opinion less relevant \
	to corporate operations. IPCs (Integrated Positronic Chassis) are a loose category of self-willed robots with a humanoid form, \
	generally self-owned after being 'born' into servitude; they are reliable and dedicated workers, albeit more than slightly \
	inhuman in outlook and perspective."
	cyborg_noun = null

	preview_icon = 'preview.dmi'
	bodytype = BODYTYPE_HUMANOID

	unarmed_attacks = list(/decl/natural_attack/punch, /decl/natural_attack/kick, /decl/natural_attack/stomp)
	inherent_verbs = list(/mob/living/carbon/human/proc/detach_limb, /mob/living/carbon/human/proc/attach_limb)

	rarity_value = 2
	strength = STR_HIGH

	min_age = 1
	max_age = 90

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3

	heat_level_1 = SYNTH_HEAT_LEVEL_1 // Gives them about 25 seconds in space before taking damage
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3

	body_temperature = null
	passive_temp_gain = 5  // This should cause IPCs to stabilize at ~80 C in a 20 C environment.

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR

	blood_color = "#1f181f"
	flesh_color = "#575757"

	has_organ = list(
		BP_POSIBRAIN = /obj/item/organ/internal/posibrain,
		BP_EYES = /obj/item/organ/internal/eyes/robot
		)

	heat_discomfort_level = 373.15
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)

	genders = list(NEUTER)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_POSITRONICS
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_ROOT,
			HOME_SYSTEM_OTHER

		),
		TAG_FACTION = list(
			FACTION_POSITRONICS,
			FACTION_OTHER
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_POSITRONICS,
		TAG_HOMEWORLD = HOME_SYSTEM_ROOT,
		TAG_FACTION = FACTION_POSITRONICS
	)

/datum/species/machine/handle_death(mob/living/carbon/human/H)
	..()
	if(istype(H.wear_mask,/obj/item/clothing/mask/monitor))
		var/obj/item/clothing/mask/monitor/M = H.wear_mask
		M.monitor_state_index = "blank"
		M.update_icon()

/datum/species/machine/post_organ_rejuvenate(obj/item/organ/org, mob/living/carbon/human/H)
	var/obj/item/organ/external/E = org
	if(istype(E) && !BP_IS_PROSTHETIC(E))
		E.robotize("Morpheus")

/*
/datum/species/machine/handle_limbs_setup(mob/living/carbon/human/H)
	for(var/obj/item/organ/external/E in H.organs)
		if(!BP_IS_PROSTHETIC(E))
			E.robotize("Morpheus")
	return
*/

/datum/species/machine/get_blood_name()
	return "oil"

/datum/species/machine/disfigure_msg(mob/living/carbon/human/H)
	var/datum/gender/T = gender_datums[H.get_gender()]
	return SPAN_DANGER("[T.His] monitor is completely busted!\n")

/mob/living/carbon/human/proc/detach_limb()
	set category = "IC"
	set name = "Detach Limb"
	set desc = "Detach one of your robotic appendages."

	if(last_special > world.time)
		return

	if(stat || paralysis || stunned || weakened || lying || restrained())
		to_chat(src, SPAN_WARNING("You can't do that in your current state!"))
		return

	var/obj/item/organ/external/E = get_organ(zone_sel.selecting)

	if(!E)
		to_chat(src, SPAN_WARNING("You are missing that limb."))
		return

	if(!BP_IS_PROSTHETIC(E))
		to_chat(src, SPAN_WARNING("You can only detach robotic limbs."))
		return

	if(E.is_stump() || E.is_broken())
		to_chat(src, SPAN_WARNING("The limb is too damaged to be removed manually!"))
		return

	if(E.vital)
		to_chat(src, SPAN_WARNING("Your safety system stops you from removing \the [E]."))
		return

	if(!do_after(src, 2 SECONDS, src)) return

	if(QDELETED(E))
		return

	last_special = world.time + 20

	E.removed(src)
	E.forceMove(get_turf(src))

	update_body()
	updatehealth()
	UpdateDamageIcon()

	visible_message(
		SPAN_NOTICE("\The [src] detaches \his [E]!"),
		SPAN_NOTICE("You detach your [E]!"))

/mob/living/carbon/human/proc/attach_limb()
	set category = "IC"
	set name = "Attach Limb"
	set desc = "Attach a robotic limb to your body."

	if(last_special > world.time)
		return

	if(stat || paralysis || stunned || weakened || lying || restrained())
		to_chat(src, SPAN_WARNING("You can not do that in your current state!"))
		return

	var/obj/item/organ/external/O = src.get_active_hand()

	if(istype(O))
		if(!BP_IS_PROSTHETIC(O))
			to_chat(src, SPAN_WARNING("You are unable to interface with organic matter."))
			return

	if(get_organ(zone_sel.selecting))
		to_chat(src, SPAN_WARNING("You are not missing that limb."))
		return

	if(!do_after(src, 2 SECONDS, src)) return

	if(QDELETED(O))
		return

	last_special = world.time + 20

	src.drop_from_inventory(O)
	O.replaced(src)
	src.update_body()
	src.updatehealth()
	src.UpdateDamageIcon()

	update_body()
	updatehealth()
	UpdateDamageIcon()

	visible_message(
		SPAN_NOTICE("\The [src] attaches \the [O] to \his body!"),
		SPAN_NOTICE("You attach \the [O] to your body!"))
