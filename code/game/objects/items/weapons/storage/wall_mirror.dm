//wip wip wup
/obj/item/storage/mirror
	name = "mirror"
	desc = "A SalonPro Nano-Mirror™ mirror! The leading brand in hair salon products, utilizing nano-machinery to style your hair just right. The black box inside warns against attempting to release the nanomachines."
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "mirror"
	density = 0
	anchored = 1
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_LARGEBOX_STORAGE
	use_sound = 'sound/effects/closet_open.ogg'

	vis_flags = VIS_HIDE

	var/shattered = 0
	var/list/ui_users

	/// Visual object for handling the viscontents
	var/weakref/ref
	var/timerid = null

	startswith = list(
		/obj/item/haircomb/random,
		/obj/item/haircomb/brush,
		/obj/random/medical/lite,
		/obj/item/lipstick,
		/obj/random/lipstick,
		/obj/random/soap,
		/obj/item/chems/spray/cleaner/deodorant,
		/obj/item/towel/random)

/obj/item/storage/mirror/Initialize()
	. = ..()
	var/obj/effect/reflection/reflection = new(src.loc)
	reflection.setup_visuals(src)
	ref = weakref(reflection)

/obj/item/storage/mirror/moved(mob/user, old_loc)
	. = ..()
	var/obj/effect/reflection/reflection = ref.resolve()
	if(istype(reflection))
		reflection.forceMove(loc)
		reflection.update_mirror_filters() //Mirrors shouldnt move but if they do so should reflection

/obj/item/storage/mirror/proc/on_flick() //Have to hide the effect
	var/obj/effect/reflection/reflection = ref.resolve()
	if(istype(reflection))
		reflection.alpha = 0
		if(timerid)
			deltimer(timerid)
			timerid = null
		timerid = addtimer(CALLBACK(reflection, /obj/effect/reflection/.proc/reset_alpha), 15, TIMER_CLIENT_TIME)

/obj/item/storage/mirror/handle_mouse_drop(atom/over, mob/user)
	. = ..()
	if(.)
		flick("mirror_open", src)
		on_flick()

/obj/item/storage/mirror/attack_hand(mob/user)
	use_mirror(user)

/obj/item/storage/mirror/proc/use_mirror(var/mob/living/carbon/human/user)
	if(shattered)
		to_chat(user, SPAN_WARNING("You enter the key combination for the style you want on the panel, but the nanomachines inside \the [src] refuse to come out."))
		return
	open_mirror_ui(user, ui_users, "SalonPro Nano-Mirror&trade;", mirror = src)

/obj/item/storage/mirror/shatter()
	if(shattered)	return
	shattered = 1
	icon_state = "mirror_broken"
	playsound(src, "shatter", 70, 1)
	desc = "Oh no, seven years of bad luck!"

	var/obj/effect/reflection/reflection = ref.resolve()
	if(istype(reflection))
		reflection.alpha_icon_state = "mirror_mask_broken"
		reflection.update_mirror_filters()

/obj/item/storage/mirror/bullet_act(var/obj/item/projectile/Proj)

	if(prob(Proj.get_structure_damage() * 2))
		if(!shattered)
			shatter()
		else
			playsound(src, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
	..()

/obj/item/storage/mirror/attackby(obj/item/W, mob/user)
	if(prob(W.force) && (user.a_intent == I_HURT))
		visible_message("<span class='warning'>[user] smashes [src] with \the [W]!</span>")
		if(!shattered)
			shatter()

	if(!(. = ..()))
		return

	flick("mirror_open", src)
	on_flick()

/obj/item/storage/mirror/Destroy()
	clear_ui_users(ui_users)
	var/obj/effect/reflection/reflection = ref.resolve()
	if(istype(reflection))
		QDEL_NULL(reflection)
	. = ..()

/obj/item/mirror
	name = "mirror"
	desc = "A SalonPro Nano-Mirror(TM) brand mirror! Now a portable version."
	icon = 'icons/obj/items/mirror.dmi'
	icon_state = "mirror"
	var/list/ui_users

/obj/item/mirror/attack_self(mob/user)
	open_mirror_ui(user, ui_users, "SalonPro Nano-Mirror&trade;", APPEARANCE_HAIR, src)

/obj/item/mirror/Destroy()
	clear_ui_users(ui_users)
	. = ..()

/proc/open_mirror_ui(var/mob/user, var/ui_users, var/title, var/flags, var/obj/item/mirror)
	if(!ishuman(user))
		return

	var/W = weakref(user)
	var/datum/nano_module/appearance_changer/AC = LAZYACCESS(ui_users, W)
	if(!AC)
		AC = new(mirror, user)
		AC.name = title
		if(flags)
			AC.flags = flags
		LAZYSET(ui_users, W, AC)
	AC.ui_interact(user)

/proc/clear_ui_users(var/list/ui_users)
	for(var/W in ui_users)
		var/AC = ui_users[W]
		qdel(AC)
	LAZYCLEARLIST(ui_users)

/obj/effect/reflection
	name = "reflection"
	desc = "Why are you locked in the bathroom?"
	layer = ABOVE_OBJ_LAYER
	anchored = TRUE
	mouse_opacity = 0
	unacidable = TRUE

	appearance_flags = KEEP_TOGETHER|TILE_BOUND|PIXEL_SCALE
	vis_flags = VIS_HIDE

	var/alpha_icon = 'icons/obj/watercloset.dmi'
	var/alpha_icon_state = "mirror_mask"
	var/obj/mirror

/obj/effect/reflection/proc/setup_visuals(target)
	mirror = target

	if(mirror.pixel_x > 0)
		dir = WEST
	else if (mirror.pixel_x < 0)
		dir = EAST

	if(mirror.pixel_y > 0)
		dir = SOUTH
	else if (mirror.pixel_y < 0) 
		dir = NORTH

	pixel_x = mirror.pixel_x
	pixel_y = mirror.pixel_y

	update_mirror_filters()

/obj/effect/reflection/proc/reset_visuals()
	mirror = null
	update_mirror_filters()

/obj/effect/reflection/proc/reset_alpha()
	alpha = initial(alpha)

/obj/effect/reflection/proc/update_mirror_filters()
	filters = null

	vis_contents = null

	if(!mirror)
		return

	var/matrix/M = matrix()
	if(dir == WEST || dir == EAST)
		M.Scale(-1, 1)
	else if(dir == SOUTH|| dir == NORTH)
		M.Scale(1, -1)

	transform = M

	filters += filter("type" = "alpha", "icon" = icon(alpha_icon, alpha_icon_state), "x" = 0, "y" = 0)

	vis_contents += get_turf(mirror)
