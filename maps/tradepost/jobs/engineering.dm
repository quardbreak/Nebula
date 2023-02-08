/datum/job/tradepost_engineer
	title = "Engineer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Head Engineer"
	outfit_type = /decl/hierarchy/outfit/job/tradepost/engine
	department_types = list(/decl/department/engineering)
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
	access = list(
		access_eva,
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_external_airlocks,
		access_construction,
		access_atmospherics,
		access_emergency_storage
	)
	minimal_access = list(
		access_eva,
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_external_airlocks,
		access_construction,
		access_atmospherics,
		access_emergency_storage
	)
	alt_titles = list()
	economic_power = 5
	minimal_player_age = 7
	event_categories = list(ASSIGNMENT_ENGINEER)

/datum/job/tradepost_engineer/head
	title = "Head Engineer"
	head_position = 1
	department_types = list(
		/decl/department/engineering,
		/decl/department/command
	)
	total_positions = 1
	spawn_positions = 1
	selection_color = COLOR_YELLOW
	req_admin_notify = 1
	economic_power = 10
	ideal_character_age = 50
	guestbanned = 1
	must_fill = 1
	not_random_selectable = 1
	access = list(
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_heads,
		access_teleporter,
		access_external_airlocks,
		access_atmospherics,
		access_emergency_storage,
		access_eva,
		access_bridge,
		access_construction, access_sec_doors,
		access_ce,
		access_RC_announce,
		access_keycard_auth,
		access_tcomsat,
		access_ai_upload
	)
	minimal_access = list(
		access_engine,
		access_engine_equip,
		access_tech_storage,
		access_maint_tunnels,
		access_heads,
		access_teleporter,
		access_external_airlocks,
		access_atmospherics,
		access_emergency_storage,
		access_eva,
		access_bridge,
		access_construction,
		access_sec_doors,
		access_ce, access_RC_announce,
		access_keycard_auth,
		access_tcomsat,
		access_ai_upload
	)
	minimal_player_age = 14
	supervisors = "your engineering wit and the Captain"
	outfit_type = /decl/hierarchy/outfit/job/tradepost/engine/head
	min_skill = list(
		SKILL_LITERACY     = SKILL_ADEPT,
		SKILL_COMPUTER     = SKILL_ADEPT,
		SKILL_EVA          = SKILL_ADEPT,
		SKILL_CONSTRUCTION = SKILL_ADEPT,
		SKILL_ELECTRICAL   = SKILL_ADEPT,
		SKILL_ATMOS        = SKILL_ADEPT,
		SKILL_ENGINES      = SKILL_EXPERT
	)
	max_skill = list(
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL   = SKILL_MAX,
		SKILL_ATMOS        = SKILL_MAX,
		SKILL_ENGINES      = SKILL_MAX
	)
	skill_points = 30
	alt_titles = list()
	event_categories = list(ASSIGNMENT_ENGINEER)
