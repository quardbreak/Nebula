/datum/job/nexus/laborer
	title = "Laborer"
	total_positions = -1
	spawn_positions = -1
	supervisors = "literally everyone, you bottom feeder"
	outfit_type = /decl/hierarchy/outfit/job/nexus/laborer
	department_types = list(/decl/department/nexus/civilian)
	economic_power = 0.1
	access = list()
	minimal_access = list()
	event_categories = list(ASSIGNMENT_JANITOR)
	alt_titles = list("Cook", "Janitor")

/datum/job/nexus/laborer/get_access()
	if(config.assistant_maint)
		return list(access_maint_tunnels)
	else
		return list()
