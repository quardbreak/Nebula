/decl/species
	var/have_blindspot = TRUE

/mob/living/carbon/human/Initialize(mapload, new_species = null)
	. = ..()
	have_blindspot = species.have_blindspot
