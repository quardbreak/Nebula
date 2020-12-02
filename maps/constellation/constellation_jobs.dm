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

/obj/machinery/suit_cycler
	initial_access = list() //TODO: re-check things on map for outdated access, since initial_access is used almost everywhere for now.

/obj/machinery/suit_cycler/constellation
	helmet = /obj/item/clothing/head/helmet/space/void/engineering
	suit = /obj/item/clothing/suit/space/void/engineering
	boots = /obj/item/clothing/shoes/magboots

/obj/machinery/suit_cycler/constellation/salvage
	helmet = /obj/item/clothing/head/helmet/space/void/engineering/salvage
	suit = /obj/item/clothing/suit/space/void/engineering/salvage