/datum/species
	var/have_blindspot = TRUE

/mob/living/carbon/human/Initialize(mapload, new_species = null)
	. = ..()
	if(species.have_blindspot)
		have_blindspot = TRUE
