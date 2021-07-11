/obj/item/organ
	name = "organ"
	icon = 'icons/obj/surgery.dmi'
	germ_level = 0
	w_class = ITEM_SIZE_TINY
	default_action_type = /datum/action/item_action/organ
	material = /decl/material/solid/meat
	origin_tech = "{'materials':1,'biotech':1}"

	// Strings.
	var/organ_tag = "organ"           // Unique identifier.
	var/parent_organ = BP_CHEST       // Organ holding this object.

	// Status tracking.
	var/status = 0                    // Various status flags (such as robotic)
	var/vital                         // Lose a vital limb, die immediately.

	// Reference data.
	var/mob/living/carbon/human/owner // Current mob owning the organ.
	var/datum/dna/dna                 // Original DNA.
	var/decl/species/species          // Original species.
	var/decl/bodytype/bodytype        // Original bodytype.
	var/list/ailments                 // Current active ailments if any.

	// Damage vars.
	var/damage = 0                    // Current damage to the organ
	var/min_broken_damage = 30        // Damage before becoming broken
	var/max_damage = 30               // Damage cap
	var/rejecting                     // Is this organ already being rejected?
	var/death_time

/obj/item/organ/Destroy()
	owner = null
	dna = null
	QDEL_NULL_LIST(ailments)
	return ..()

/obj/item/organ/proc/refresh_action_button()
	return action

/obj/item/organ/attack_self(var/mob/user)
	return (owner && loc == owner && owner == user)

/obj/item/organ/proc/update_health()
	return

/obj/item/organ/proc/is_broken()
	return (damage >= min_broken_damage || (status & ORGAN_CUT_AWAY) || (status & ORGAN_BROKEN))

//Second argument may be a dna datum; if null will be set to holder's dna.
/obj/item/organ/Initialize(mapload, var/datum/dna/given_dna)
	. = ..(mapload)
	if(!istype(given_dna))
		given_dna = null

	if(max_damage)
		min_broken_damage = FLOOR(max_damage / 2)
	else
		max_damage = min_broken_damage * 2

	if(iscarbon(loc))
		owner = loc
		if(!given_dna && owner.dna)
			given_dna = owner.dna
		else
			log_debug("[src] spawned in [owner] without a proper DNA.")

	if (given_dna)
		set_dna(given_dna)
	if (!species)
		species = get_species_by_key(global.using_map.default_species)

	species.resize_organ(src)
	bodytype = owner?.bodytype || species.default_bodytype

	create_reagents(5 * (w_class-1)**2)
	reagents.add_reagent(/decl/material/liquid/nutriment/protein, reagents.maximum_volume)

	update_icon()

/obj/item/organ/proc/set_dna(var/datum/dna/new_dna)
	if(new_dna)
		dna = new_dna.Clone()
		if(!blood_DNA)
			blood_DNA = list()
		blood_DNA.Cut()
		blood_DNA[dna.unique_enzymes] = dna.b_type
		species = get_species_by_key(dna.species)
		bodytype = owner?.bodytype || species.default_bodytype
		if (!species)
			PRINT_STACK_TRACE("Invalid DNA species. Expected a valid species name as string, was: [log_info_line(dna.species)]")

/obj/item/organ/proc/die()
	damage = max_damage
	status |= ORGAN_DEAD
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL_LIST(ailments)
	death_time = world.time
	if(owner && vital)
		owner.death()

/obj/item/organ/Process()

	if(loc != owner)
		owner = null

	//dead already, no need for more processing
	if(status & ORGAN_DEAD)
		return
	// Don't process if we're in a freezer, an MMI or a stasis bag.or a freezer or something I dunno
	if(is_preserved())
		return
	//Process infections
	if (BP_IS_PROSTHETIC(src) || (owner && owner.species && (owner.species.species_flags & SPECIES_FLAG_IS_PLANT)))
		germ_level = 0
		return

	if(!owner && reagents)
		if(prob(40) && reagents.total_volume >= 0.1)
			if(reagents.has_reagent(/decl/material/liquid/blood))
				blood_splatter(get_turf(src), src, 1)
			reagents.remove_any(0.1)
		if(config.organs_decay)
			take_general_damage(rand(1,3))
		germ_level += rand(2,6)
		if(germ_level >= INFECTION_LEVEL_TWO)
			germ_level += rand(2,6)
		if(germ_level >= INFECTION_LEVEL_THREE)
			die()

	else if(owner && owner.bodytemperature >= 170)	//cryo stops germs from moving and doing their bad stuffs
		//** Handle antibiotics and curing infections
		handle_antibiotics()
		handle_rejection()
		handle_germ_effects()

	if(owner && length(ailments))
		for(var/datum/ailment/ailment in ailments)
			if(!ailment.treated_by_reagent_type)
				continue
			var/treated
			var/datum/reagents/bloodstr_reagents = owner.get_injected_reagents()
			if(bloodstr_reagents)
				if(REAGENT_VOLUME(bloodstr_reagents, ailment.treated_by_reagent_type) >= ailment.treated_by_reagent_dosage)
					treated = bloodstr_reagents
				else if(REAGENT_VOLUME(owner.reagents, ailment.treated_by_reagent_type) >= ailment.treated_by_reagent_dosage)
					treated = owner.reagents
				else
					var/datum/reagents/ingested = owner.get_ingested_reagents()
					if(ingested && REAGENT_VOLUME(ingested, ailment.treated_by_reagent_type) >= ailment.treated_by_reagent_dosage)
						treated = ingested
			if(treated)
				ailment.was_treated_by_medication(treated)

	//check if we've hit max_damage
	if(damage >= max_damage)
		die()

/obj/item/organ/proc/is_preserved()
	if(istype(loc,/obj/item/organ))
		var/obj/item/organ/O = loc
		return O.is_preserved()
	else
		return (istype(loc,/obj/item/mmi) || istype(loc,/obj/structure/closet/body_bag/cryobag) || istype(loc,/obj/structure/closet/crate/freezer) || istype(loc,/obj/item/storage/box/freezer))

/obj/item/organ/examine(mob/user)
	. = ..(user)
	show_decay_status(user)

/obj/item/organ/proc/show_decay_status(mob/user)
	if(status & ORGAN_DEAD)
		to_chat(user, "<span class='notice'>The decay has set into \the [src].</span>")

/obj/item/organ/proc/handle_germ_effects()
	//** Handle the effects of infections
	var/germ_immunity = owner.get_immunity() //reduces the amount of times we need to call this proc
	var/antibiotics = REAGENT_VOLUME(owner.reagents, /decl/material/liquid/antibiotics)

	if (germ_level > 0 && germ_level < INFECTION_LEVEL_ONE/2 && prob(germ_immunity*0.3))
		germ_level--

	if (germ_level >= INFECTION_LEVEL_ONE/2)
		//aiming for germ level to go from ambient to INFECTION_LEVEL_TWO in an average of 15 minutes, when immunity is full.
		if(antibiotics < 5 && prob(round(germ_level/6 * owner.immunity_weakness() * 0.01)))
			if(germ_immunity > 0)
				germ_level += Clamp(round(1/germ_immunity), 1, 10) // Immunity starts at 100. This doubles infection rate at 50% immunity. Rounded to nearest whole.
			else // Will only trigger if immunity has hit zero. Once it does, 10x infection rate.
				germ_level += 10

	if(germ_level >= INFECTION_LEVEL_ONE)
		var/fever_temperature = (owner.species.heat_level_1 - owner.species.body_temperature - 5)* min(germ_level/INFECTION_LEVEL_TWO, 1) + owner.species.body_temperature
		owner.bodytemperature += between(0, (fever_temperature - T20C)/BODYTEMP_COLD_DIVISOR + 1, fever_temperature - owner.bodytemperature)

	if (germ_level >= INFECTION_LEVEL_TWO)
		var/obj/item/organ/external/parent = owner.get_organ(parent_organ)
		//spread germs
		if (antibiotics < 5 && parent.germ_level < germ_level && ( parent.germ_level < INFECTION_LEVEL_ONE*2 || prob(owner.immunity_weakness() * 0.3) ))
			parent.germ_level++

		if (prob(3))	//about once every 30 seconds
			take_general_damage(1,silent=prob(30))

/obj/item/organ/proc/handle_rejection()
	// Process unsuitable transplants. TODO: consider some kind of
	// immunosuppressant that changes transplant data to make it match.
	if(owner.get_immunity() < 10) //for now just having shit immunity will suppress it
		return
	if(BP_IS_PROSTHETIC(src))
		return
	if(dna)
		if(!rejecting)
			if(owner.blood_incompatible(dna.b_type, species))
				rejecting = 1
		else
			rejecting++ //Rejection severity increases over time.
			if(rejecting % 10 == 0) //Only fire every ten rejection ticks.
				switch(rejecting)
					if(1 to 50)
						germ_level++
					if(51 to 200)
						germ_level += rand(1,2)
					if(201 to 500)
						germ_level += rand(2,3)
					if(501 to INFINITY)
						germ_level += rand(3,5)
						owner.reagents.add_reagent(/decl/material/liquid/coagulated_blood, rand(1,2))

/obj/item/organ/proc/receive_chem(chemical)
	return 0

/obj/item/organ/proc/remove_rejuv()
	qdel(src)

/obj/item/organ/proc/rejuvenate(var/ignore_prosthetic_prefs)
	damage = 0
	status = initial(status)
	if(ignore_prosthetic_prefs && ishuman(owner) && owner.client && owner.client.prefs && owner.client.prefs.real_name == owner.real_name)
		for(var/decl/aspect/aspect as anything in owner.personal_aspects)
			if(aspect.applies_to_organ(organ_tag))
				aspect.apply(owner)
	if(species)
		species.post_organ_rejuvenate(src, owner)

//Germs
/obj/item/organ/proc/handle_antibiotics()
	if(!owner || !germ_level)
		return

	var/antibiotics = GET_CHEMICAL_EFFECT(owner, CE_ANTIBIOTIC)
	if (!antibiotics)
		return

	if (germ_level < INFECTION_LEVEL_ONE)
		germ_level = 0	//cure instantly
	else if (germ_level < INFECTION_LEVEL_TWO)
		germ_level -= 5	//at germ_level == 500, this should cure the infection in 5 minutes
	else
		germ_level -= 3 //at germ_level == 1000, this will cure the infection in 10 minutes
	if(owner && owner.lying)
		germ_level -= 2
	germ_level = max(0, germ_level)

/obj/item/organ/proc/take_general_damage(var/amount, var/silent = FALSE)
	CRASH("Not Implemented")

/obj/item/organ/proc/heal_damage(amount)
	if (can_recover())
		damage = between(0, damage - round(amount, 0.1), max_damage)

/obj/item/organ/proc/robotize(var/company, var/skip_prosthetics = 0, var/keep_organs = 0, var/apply_material = /decl/material/solid/metal/steel)
	status = ORGAN_PROSTHETIC
	reagents?.clear_reagents()
	material = GET_DECL(apply_material)
	matter = null
	create_matter()

/obj/item/organ/proc/mechassist() //Used to add things like pacemakers, etc
	status = ORGAN_ASSISTED

/**
 *  Remove an organ
 *
 *  drop_organ - if true, organ will be dropped at the loc of its former owner
 *
 *  Also, Observer Pattern Implementation: Dismembered Handling occurs here.
 */
/obj/item/organ/proc/removed(var/mob/living/user, var/drop_organ=1)

	if(!istype(owner))
		return
	events_repository.raise_event(/decl/observ/dismembered, owner, src)

	action_button_name = null

	if(drop_organ)
		dropInto(owner.loc)

	START_PROCESSING(SSobj, src)
	rejecting = null
	if(!BP_IS_PROSTHETIC(src) && species && reagents?.total_volume < 5)
		owner.vessel.trans_to(src, 5 - reagents.total_volume, 1, 1)

	if(vital)
		if(user)
			admin_attack_log(user, owner, "Removed a vital organ ([src]).", "Had a vital organ ([src]) removed.", "removed a vital organ ([src]) from")
		owner.death()
	screen_loc = null
	owner.client?.screen -= src
	owner = null

	for(var/datum/ailment/ailment in ailments)
		if(ailment.timer_id)
			deltimer(ailment.timer_id)
			ailment.timer_id = null

/obj/item/organ/proc/replaced(var/mob/living/carbon/human/target, var/obj/item/organ/external/affected)
	owner = target
	action_button_name = initial(action_button_name)
	forceMove(owner) //just in case
	if(BP_IS_PROSTHETIC(src))
		set_dna(owner.dna)
	for(var/datum/ailment/ailment in ailments)
		ailment.begin_ailment_event()
	return TRUE

/obj/item/organ/attack(var/mob/target, var/mob/user)
	if(status & ORGAN_PROSTHETIC || !istype(target) || !istype(user) || (user != target && user.a_intent == I_HELP))
		return ..()

	if(alert("Do you really want to use this organ as food? It will be useless for anything else afterwards.",,"Ew, no.","Bon appetit!") == "Ew, no.")
		to_chat(user, SPAN_NOTICE("You successfully repress your cannibalistic tendencies."))
		return

	if(QDELETED(src))
		return

	if(!user.unEquip(src))
		return

	var/obj/item/chems/food/snacks/organ/O = new(get_turf(src))
	O.SetName(name)
	O.appearance = src
	if(reagents && reagents.total_volume)
		reagents.trans_to(O, reagents.total_volume)
	transfer_fingerprints_to(O)
	user.put_in_active_hand(O)
	qdel(src)
	target.attackby(O, user)

/obj/item/organ/proc/can_feel_pain()
	return (!BP_IS_PROSTHETIC(src) && (!species || !(species.species_flags & SPECIES_FLAG_NO_PAIN)))

/obj/item/organ/proc/is_usable()
	return !(status & (ORGAN_CUT_AWAY|ORGAN_MUTATED|ORGAN_DEAD))

/obj/item/organ/proc/can_recover()
	return (max_damage > 0) && !(status & ORGAN_DEAD) || death_time >= world.time - ORGAN_RECOVERY_THRESHOLD

/obj/item/organ/proc/get_scan_results(var/tag = FALSE)
	. = list()
	if(BP_IS_CRYSTAL(src))
		. += tag ? "<span class='average'>Crystalline</span>" : "Crystalline"
	else if(BP_IS_ASSISTED(src))
		. += tag ? "<span class='average'>Assisted</span>" : "Assisted"
	else if(BP_IS_PROSTHETIC(src))
		. += tag ? "<span class='average'>Mechanical</span>" : "Mechanical"
	if(status & ORGAN_CUT_AWAY)
		. += tag ? "<span class='bad'>Severed</span>" : "Severed"
	if(status & ORGAN_MUTATED)
		. += tag ? "<span class='bad'>Genetic Deformation</span>" : "Genetic Deformation"
	if(status & ORGAN_DEAD)
		if(can_recover())
			. += tag ? "<span class='bad'>Decaying</span>" : "Decaying"
		else
			. += tag ? "<span style='color:#999999'>Necrotic</span>" : "Necrotic"
	if(BP_IS_BRITTLE(src))
		. += tag ? "<span class='bad'>Brittle</span>" : "Brittle"

	switch (germ_level)
		if (INFECTION_LEVEL_ONE to INFECTION_LEVEL_ONE + ((INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3))
			. +=  "Mild Infection"
		if (INFECTION_LEVEL_ONE + ((INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3) to INFECTION_LEVEL_ONE + (2 * (INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3))
			. +=  "Mild Infection+"
		if (INFECTION_LEVEL_ONE + (2 * (INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3) to INFECTION_LEVEL_TWO)
			. +=  "Mild Infection++"
		if (INFECTION_LEVEL_TWO to INFECTION_LEVEL_TWO + ((INFECTION_LEVEL_THREE - INFECTION_LEVEL_THREE) / 3))
			if(tag)
				. += "<span class='average'>Acute Infection</span>"
			else
				. +=  "Acute Infection"
		if (INFECTION_LEVEL_TWO + ((INFECTION_LEVEL_THREE - INFECTION_LEVEL_THREE) / 3) to INFECTION_LEVEL_TWO + (2 * (INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3))
			if(tag)
				. += "<span class='average'>Acute Infection+</span>"
			else
				. +=  "Acute Infection+"
		if (INFECTION_LEVEL_TWO + (2 * (INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3) to INFECTION_LEVEL_THREE)
			if(tag)
				. += "<span class='average'>Acute Infection++</span>"
			else
				. +=  "Acute Infection++"
		if (INFECTION_LEVEL_THREE to INFINITY)
			if(tag)
				. += "<span class='bad'>Septic</span>"
			else
				. +=  "Septic"
	if(rejecting)
		if(tag)
			. += "<span class='bad'>Genetic Rejection</span>"
		else
			. += "Genetic Rejection"

//used by stethoscope
/obj/item/organ/proc/listen()
	return

/obj/item/organ/proc/get_mechanical_assisted_descriptor()
	return "mechanically-assisted [name]"

var/global/list/ailment_reference_cache = list()
/proc/get_ailment_reference(var/ailment_type)
	if(!ispath(ailment_type, /datum/ailment))
		return
	if(!global.ailment_reference_cache[ailment_type])
		global.ailment_reference_cache[ailment_type] = new ailment_type
	return global.ailment_reference_cache[ailment_type]

/obj/item/organ/proc/get_possible_ailments()
	. = list()
	for(var/ailment_type in subtypesof(/datum/ailment))
		var/datum/ailment/ailment = ailment_type
		if(initial(ailment.category) == ailment_type)
			continue
		ailment = get_ailment_reference(ailment_type)
		if(ailment.can_apply_to(src))
			. += ailment_type
	for(var/datum/ailment/ailment in ailments)
		. -= ailment.type

/obj/item/organ/emp_act(severity)
	. = ..()
	if(BP_IS_PROSTHETIC(src))
		if(length(ailments) < 3 && prob(15 - (5 * length(ailments))))
			var/list/possible_ailments = get_possible_ailments()
			if(length(possible_ailments))
				add_ailment(pick(possible_ailments))

/obj/item/organ/proc/add_ailment(var/datum/ailment/ailment)
	if(ispath(ailment, /datum/ailment))
		ailment = get_ailment_reference(ailment)
	if(!istype(ailment) || !ailment.can_apply_to(src))
		return FALSE
	LAZYADD(ailments, new ailment.type(src))
	return TRUE

/obj/item/organ/proc/add_random_ailment()
	var/list/possible_ailments = get_possible_ailments()
	if(length(possible_ailments))
		add_ailment(pick(possible_ailments))

/obj/item/organ/proc/remove_ailment(var/datum/ailment/ailment)
	if(ispath(ailment, /datum/ailment))
		for(var/datum/ailment/ext_ailment in ailments)
			if(ailment == ext_ailment.type)
				LAZYREMOVE(ailments, ext_ailment)
				return TRUE
	else if(istype(ailment))
		for(var/datum/ailment/ext_ailment in ailments)
			if(ailment == ext_ailment)
				LAZYREMOVE(ailments, ext_ailment)
				return TRUE
	return FALSE
