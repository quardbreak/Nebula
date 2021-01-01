/mob/var/is_shifted = FALSE

/mob/living/Move()
	. = ..()

	if(is_shifted && !buckled)
		is_shifted = FALSE
		pixel_x = default_pixel_x
		pixel_y = default_pixel_y

/mob/proc/can_shift()
	return !(incapacitated() || buckled || LAZYLEN(grabbed_by))

/mob/verb/shiftnorth()
	set hidden = TRUE

	if(!canface() || !can_shift())
		return FALSE

	if(pixel_y <= 16)
		pixel_y++
		is_shifted = TRUE

/mob/verb/shiftsouth()
	set hidden = TRUE

	if(!canface() || !can_shift())
		return FALSE

	if(pixel_y >= -8)
		pixel_y--
		is_shifted = TRUE

/mob/verb/shiftwest()
	set hidden = TRUE

	if(!canface() || !can_shift())
		return FALSE

	if(pixel_x >= -8)
		pixel_x--
		is_shifted = TRUE

/mob/verb/shifteast()
	set hidden = TRUE

	if(!canface() || !can_shift())
		return FALSE

	if(pixel_x <= 8)
		pixel_x++
		is_shifted = TRUE
