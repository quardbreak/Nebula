//Culture

/decl/species/resomi
	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_RESOMI
		)
	)

/decl/cultural_info/culture/resomi
	name = CULTURE_RESOMI
	description = "A race of feathered raptors who developed on a cold world, almost \
	outside of the Goldilocks zone. Extremely fragile, they developed hunting skills \
	that emphasized taking out their prey without themselves getting hit. They are an \
	advanced culture on good terms with Skrellian and Human interests."
	language = /decl/language/resomi
	secondary_langs = list(
		/decl/language/human/common,
		/decl/language/sign
	)

//Language

/decl/language/resomi
	name = LANGUAGE_RESOMI
	desc = "A trilling language spoken by the diminutive Resomi."
	speech_verb  = "chirps"
	ask_verb     = "chirrups"
	exclaim_verb = "chirrups"
	whisper_verb = "chirps softly"
	key   = "e"
	flags = WHITELISTED
	shorthand = "SCH"
	syllables = list(
			"ca", "ra", "ma", "sa", "na", "ta", "la", "sha", "scha", "a", "a",
			"ce", "re", "me", "se", "ne", "te", "le", "she", "sche", "e", "e",
			"ci", "ri", "mi", "si", "ni", "ti", "li", "shi", "schi", "i", "i")
	colour = "alien"
	space_chance = 50

/decl/language/resomi/get_random_name(gender)
	return ..(gender, 1, 4, 1.5)
