/decl/species/human/tritonian
	name = SPECIES_TRITONIAN
	name_plural = "Tritonians"
	description = "Of all human gene-adapts, the Tritonian genotype is probably the most wildly divergent from \
	baseline humanity. Conceived alongside dolphin and octopus genetic engineering projects, this genotype \
	is adapted for amphibious life on flooded ocean moons like Triton, but is equally comfortable in a range \
	of aquatic and non-aquatic environments. Their heavy, seal-like bodies have sharp teeth, recessed eyes, \
	and thick blue-grey skin with a layer of dense blubber for insulation and protection, but they find \
	it difficult to move quickly on land due to their bulk."

	icobase =     'icons/tritonian_body.dmi'
	preview_icon= 'icons/tritonian_preview.dmi'

	slowdown   = 0.5
	oxy_mod    = 0.5
	toxins_mod = 1.5

	body_temperature =    302
	water_soothe_amount = 5

	unarmed_attacks = list(/decl/natural_attack/stomp, /decl/natural_attack/kick, /decl/natural_attack/punch, /decl/natural_attack/bite/sharp)

	override_organ_types = list(BP_LUNGS = /obj/item/organ/internal/lungs/gills)
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE_TRITON | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

/obj/item/organ/internal/lungs/gills
	name = "tritonian lungs"
	has_gills = TRUE