/datum/map/constellation
	default_law_type = /datum/ai_laws/corporate
	default_assistant_title = "Deck Hand"
	allowed_jobs = list(
		/datum/job/constellation_captain,
		/datum/job/constellation_engineer/head,
		/datum/job/constellation_doctor,
		/datum/job/constellation_researcher/head,
		/datum/job/constellation_first_mate,
		/datum/job/cyborg,
		/datum/job/assistant,
		/datum/job/constellation_engineer,
		/datum/job/constellation_doctor/head,
		/datum/job/constellation_researcher
	)

/obj/machinery/suit_cycler/constellation
	boots = /obj/item/clothing/shoes/magboots
	req_access = list()

/obj/machinery/suit_cycler/constellation/Initialize()
	if(prob(75))
		suit = pick(list(
			/obj/item/clothing/suit/space/void/mining, 
			/obj/item/clothing/suit/space/void/engineering, 
			/obj/item/clothing/suit/space/void/pilot, 
			/obj/item/clothing/suit/space/void/excavation, 
			/obj/item/clothing/suit/space/void/engineering/salvage
		))
	if(prob(75))
		helmet = pick(list(
			/obj/item/clothing/head/helmet/space/void/mining, 
			/obj/item/clothing/head/helmet/space/void/engineering, 
			/obj/item/clothing/head/helmet/space/void/pilot, 
			/obj/item/clothing/head/helmet/space/void/excavation, 
			/obj/item/clothing/head/helmet/space/void/engineering/salvage
		))
	. = ..()