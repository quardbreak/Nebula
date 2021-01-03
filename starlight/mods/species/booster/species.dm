/decl/species/human/booster
	name = SPECIES_BOOSTER
	name_plural = "Boosters"
	description = "The self-proclaimed 'boosters' are a loosely affiliated group of self-modifying \
	bio-tinkers, engineers and radical philosophers dedicated to expanding the definition of what it \
	means to be human. Conservatives frown on their excessive recklessness, and most booster habitats \
	are found on the outskirts of systems - some even linger at the edge of human space.<br><br>The \
	shared Booster genotype is extremely unstable and liable for rapid, apparently random change, \
	but is certainly both unique and remarkable in its ability to cope with the extremes that the \
	Universe can throw at it."
	var/list/mods = list()

#define MOD_BASE     0.85
#define MOD_VARIANCE 0.35
/decl/species/human/booster/proc/get_mod(mob/living/carbon/human/booster, mod_type)
	if(istype(booster) && !booster.isSynthetic())
		var/mob_ref = booster.ckey || "\ref[booster]"
		if(!islist(mods[mob_ref]))
			var/list/new_mods = list()
			new_mods["brute"] =     MOD_BASE + (MOD_VARIANCE * rand())
			new_mods["burn"] =      MOD_BASE + (MOD_VARIANCE * rand())
			new_mods["toxins"] =    MOD_BASE + (MOD_VARIANCE * rand())
			new_mods["radiation"] = MOD_BASE + (MOD_VARIANCE * rand())
			new_mods["slowdown"] =  pick(-0.5, 0, 0.5)
			mods[mob_ref] = new_mods
		var/list/mob_mods = mods[mob_ref]
		. = mob_mods[mod_type] || 1
#undef MOD_BASE
#undef MOD_VARIANCE

/decl/species/human/booster/get_brute_mod(mob/living/carbon/human/H)
	. = get_mod(H, "brute")
	if(isnull(.))
		. = ..()

/decl/species/human/booster/get_burn_mod(mob/living/carbon/human/H)
	. = get_mod(H, "burn")
	if(isnull(.))
		. = ..()

/decl/species/human/booster/get_toxins_mod(mob/living/carbon/human/H)
	. = get_mod(H, "toxins")
	if(isnull(.))
		. = ..()

/decl/species/human/booster/get_radiation_mod(mob/living/carbon/human/H)
	. = get_mod(H, "radiation")
	if(isnull(.))
		. = ..()

/decl/species/human/booster/get_slowdown(mob/living/carbon/human/H)
	. = get_mod(H, "slowdown")
	if(isnull(.))
		. = ..()
