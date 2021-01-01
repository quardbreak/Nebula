/decl/species/human/vatgrown
	name        = SPECIES_VATGROWN
	name_plural = "Vat-Grown Humans"
	description = {"With cloning on the forefront of human scientific advancement, cheap mass production
	of bodies is a very real and rather ethically grey industry. Although slavery, indentured servitude
	and flash-cloning are all illegal in SCG space, there still exists a margin for those legitimate
	corporations able to take up contracts for growing and raising vat-grown humans to populate new
	colonies or installations. Many vat-grown humans come from one of these projects, making up the
	majority of those referred to as the nonborn - those with singular names and an identifier, such as
	ID-John, BQ1-Bob or Thomas-582 - while others, bearing more human-sounding names, are created for
	and raised as members of regular human families. Still others are the lab-created designer progeny
	of the SCG's rich elite.<br/><br/>Vat-grown humans tend to be paler than baseline, though those
	with darker skin better display the dull, greenish hue resulting from their artificial growth.
	Vat-grown humans have no appendix and fewer inherited genetic disabilities but have a weakened
	metabolism."}

	icobase      = 'starlight/mods/species/vatgrown/icons/vatgrown_body.dmi'
	preview_icon = 'starlight/mods/species/vatgrown/icons/vatgrown_preview.dmi'

	toxins_mod =   1.1
	has_organ = list(
		BP_HEART =    /obj/item/organ/internal/heart,
		BP_STOMACH =  /obj/item/organ/internal/stomach,
		BP_LUNGS =    /obj/item/organ/internal/lungs,
		BP_LIVER =    /obj/item/organ/internal/liver,
		BP_KIDNEYS =  /obj/item/organ/internal/kidneys,
		BP_BRAIN =    /obj/item/organ/internal/brain,
		BP_EYES =     /obj/item/organ/internal/eyes
		)

	additional_available_cultural_info = list(
		TAG_CULTURE = list(CULTURE_HUMAN_VATGROWN)
	)
	default_cultural_info = list(
		TAG_CULTURE = CULTURE_HUMAN_VATGROWN
	)
