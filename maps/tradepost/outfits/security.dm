/obj/item/card/id/tradepost/security
	name = "identification card"
	desc = "A card issued to security staff."
	detail_color = COLOR_BLOOD_HUMAN

/obj/item/card/id/tradepost/security/head
	desc = "A card which represents blood and destiny."
	extra_details = list("goldstripe")

/decl/hierarchy/outfit/job/tradepost/security
	name = "Tradepost - Job - Deputy"
	uniform = /obj/item/clothing/under/det
	shoes = /obj/item/clothing/shoes/jackboots
	glasses = /obj/item/clothing/glasses/eyepatch/hud/security
	belt = /obj/item/gun/energy/taser
	id_type = /obj/item/card/id/tradepost/security

/decl/hierarchy/outfit/job/tradepost/security/head
	name = "Tradepost - Job - Sheriff"
	uniform = /obj/item/clothing/under/tactical
	suit = /obj/item/clothing/suit/armor/hos
	head = /obj/item/clothing/head/HoS
	gloves = /obj/item/clothing/gloves/tactical
	glasses = /obj/item/clothing/glasses/thermal/plain/eyepatch
	belt = /obj/item/gun/energy/gun
	hands = list(/obj/item/gun/energy/pulse_pistol,/obj/item/flash)
	id_type = /obj/item/card/id/tradepost/security/head
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL