/obj/item/card/id/tradepost/engineering
	name = "identification card"
	desc = "A card issued to engineering staff."
	detail_color = COLOR_SUN

/obj/item/card/id/tradepost/engineering/head
	desc = "A card which represents creativity and ingenuity."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/tradepost/engine
	name = "Tradepost - Job - Engineer"
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL
	uniform = /obj/item/clothing/under/hazard
	id_type = /obj/item/card/id/tradepost/engineering
	shoes = /obj/item/clothing/shoes/workboots
	belt = /obj/item/storage/belt/utility/full
	pda_type = /obj/item/modular_computer/pda/engineering

/decl/hierarchy/outfit/job/tradepost/engine/head
	name = "Tradepost - Job - Head Engineer"
	uniform = /obj/item/clothing/under/chief_engineer
	glasses = /obj/item/clothing/glasses/welding/superior
	suit = /obj/item/clothing/suit/storage/hazardvest
	gloves = /obj/item/clothing/gloves/thick
	pda_type = /obj/item/modular_computer/pda/heads/ce
	id_type = /obj/item/card/id/tradepost/engineering/head