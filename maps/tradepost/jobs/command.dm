/datum/job/tradepost_captain
	title = "Captain"
	total_positions = 1
	spawn_positions = 1
	supervisors = "your profit margin, your conscience, and the Trademaster"
	outfit_type = /decl/hierarchy/outfit/job/tradepost/captain
	department_types = list(/decl/department/command)
	selection_color = COLOR_INDIGO
	skill_points = 30
	min_skill = list(
		SKILL_LITERACY = SKILL_ADEPT,
		SKILL_WEAPONS  = SKILL_ADEPT,
		SKILL_SCIENCE  = SKILL_ADEPT,
		SKILL_PILOT    = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_PILOT   = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX
	)
	access = list()
	minimal_access = list()
	economic_power = 20
	minimal_player_age = 14
	ideal_character_age = 70
	guestbanned = 1
	forced_spawnpoint = /decl/spawnpoint/cryo/captain
	head_position = 1
	req_admin_notify = 1
	must_fill = 1
	not_random_selectable = 1