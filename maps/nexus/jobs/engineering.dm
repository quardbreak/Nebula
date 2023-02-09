/datum/job/nexus/engineer
	title = "Engineer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Head Engineer"
	outfit_type = /decl/hierarchy/outfit/job/nexus/engineer
	department_types = list(/decl/department/nexus/engineering)
	selection_color = COLOR_YELLOW_GRAY
	skill_points = 20
	min_skill = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_COMPUTER     = SKILL_BASIC,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL   = SKILL_BASIC,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_ENGINES      = SKILL_BASIC
	)
	max_skill = list(
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)

	alt_titles = list()
	economic_power = 5
	minimal_player_age = 7
	event_categories = list(ASSIGNMENT_ENGINEER)
