/obj/item/card/id/tradepost/medical
	name = "identification card"
	desc = "A card issued to medical staff."
	detail_color = COLOR_PALE_BLUE_GRAY

/obj/item/card/id/tradepost/medical/head
	desc = "A card which represents life and hope."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/tradepost/doc
	name = "Tradepost - Job - Doctor"
	uniform = /obj/item/clothing/under/sterile
	shoes = /obj/item/clothing/shoes/color/white
	pda_type = /obj/item/modular_computer/pda/medical
	id_type = /obj/item/card/id/tradepost/medical

/decl/hierarchy/outfit/job/tradepost/doc/head
	name = "Tradepost - Job - Head Doctor"
	head = /obj/item/clothing/head/surgery
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	id_type = /obj/item/card/id/tradepost/medical/head