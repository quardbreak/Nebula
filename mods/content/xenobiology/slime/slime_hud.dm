/datum/hud/slime/FinalizeInstantiation()
	src.adding = list()

	var/atom/movable/screen/using

	using = new /atom/movable/screen/intent()
	src.adding += using
	action_intent = using

	mymob.client.screen = list()
	mymob.client.screen += src.adding
