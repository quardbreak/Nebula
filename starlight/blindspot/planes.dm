/obj/screen/plane_master/blindspot_target
	name = "vision cone master"
	plane = HIDDEN_SHIT_PLANE
	render_target = "blindspot_target"

/obj/screen/plane_master/blindspot_blender
	render_target = "blindspot_target"

//A series of vision related masters. They all have the same RT name to lower load on client.
/obj/screen/plane_master/blindspot/

/obj/screen/plane_master/blindspot/primary/Initialize() //For when you want things to not appear under the blind section.
	. = ..()
	filters += filter(type = "alpha", render_source = "blindspot_target", flags = MASK_INVERSE)

/obj/screen/plane_master/blindspot/inverted //for things you want specifically to show up on the blind section.

/obj/screen/plane_master/blindspot/inverted/Initialize()
	. = ..()
	filters += filter(type = "alpha", render_source = "blindspot_target")