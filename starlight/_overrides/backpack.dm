/* Restriction code */
/obj/item/storage/backpack
	var/worn_access = FALSE

/obj/item/storage/backpack/satchel
	worn_access = TRUE
//	max_w_class = ITEM_SIZE_NORMAL todo: revisit, fix travis error

/obj/item/storage/backpack/attackby(obj/item/W, mob/user)
	if(!worn_check(user)) return
	..(W, user)

/obj/item/storage/backpack/equipped(mob/user, slot)
	if(!worn_check(user, show_warning = FALSE))
		close(user)
	..(user, slot)

/obj/item/storage/backpack/attack_hand(mob/user)
	if(!worn_check(user)) return
	..(user)

/obj/item/storage/backpack/open(mob/user)
	if(!worn_check(user)) return
	..(user)

/obj/item/storage/backpack/proc/worn_check(mob/L, show_warning = TRUE)
	if(!worn_access && L?.get_equipped_item(slot_back_str) == src)
		if(show_warning)
			to_chat(L, SPAN_WARNING("You need to take off \the [src] before you can use it!"))
		return FALSE
	return TRUE


/* Satchel subtypes */

/obj/item/storage/backpack/satchel/pocketbook/navy
	name = "navy pocketbook"
	color = "#1c2133"

/obj/item/storage/backpack/satchel/pocketbook/khaki
	name = "khaki pocketbook"
	color = "#baa481"
