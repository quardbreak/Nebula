/decl/hierarchy/outfit/job/constellation/hand/researcher
	name = TRADESHIP_OUTFIT_JOB_NAME("Head Researcher")
	shoes = /obj/item/clothing/shoes/dress
	pda_type = /obj/item/modular_computer/pda/science
	id_type = /obj/item/card/id/constellation/science/head

/obj/item/card/id/constellation/science
	name = "identification card"
	desc = "A card issued to science staff."
	job_access_type = /datum/job/constellation_researcher
	detail_color = COLOR_PALE_PURPLE_GRAY

/decl/hierarchy/outfit/job/constellation/hand/researcher/junior
	name = TRADESHIP_OUTFIT_JOB_NAME("Junior Researcher")
	id_type = /obj/item/card/id/constellation/science

/obj/item/card/id/constellation/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	job_access_type = /datum/job/constellation_researcher/head
	extra_details = list("goldstripe")
