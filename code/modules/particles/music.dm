//
// Music Notes, Sweet Sweet Music Notes
//
/particles/music
	width = 64
	height = 64
	count = 4
	spawning = 0.1
	bound1 = list(-1000, -240, -1000)
	lifespan = 2 SECONDS
	fade = 1.5 SECONDS
	fadein = 5
	// spawn within a certain x,y,z space
	icon = 'icons/effects/particles/music.dmi'
	icon_state = list("quarter" = 5, "beamed_eighth" = 1, "eighth" = 1)
	gradient = list(
		0, "#f00",
		1, "#ff0",
		2, "#0f0",
		3, "#0ff",
		4, "#00f",
		5, "#f0f",
		6, "#f00",
		"loop"
	)
	color = generator("num", 0, 6)
	gravity = list(0, 0.5)
	friction = 0.4
	drift = generator("box", list(-1, -0.5, 0), list(1, 0.5, 0), LINEAR_RAND)

/atom/movable/particle_holder/music
	alpha = 200
	particles = new /particles/music

/atom/movable/particle_holder/music/Initialize()
	. = ..()
	add_filter("outline", 1, list(type = "outline", size = 0.5, color = "#444"))

/atom/movable/particle_holder/music/proc/is_playing()
	return !!particles.spawning
