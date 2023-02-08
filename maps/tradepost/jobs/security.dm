/datum/job/tradepost_security
	title = "Deputy"
	supervisors = "the Sheriff"
	spawn_positions = 3
	total_positions = 3
	outfit_type = /decl/hierarchy/outfit/job/tradepost/security
	department_types = list(/decl/department/security)
	selection_color = COLOR_RED_GRAY
	economic_power = 7
	minimal_player_age = 7
	access = list(
		access_security,
		access_brig
	)
	minimal_access = list(
		access_security,
		access_forensics_lockers,
		access_brig
	)
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_COMBAT	= SKILL_BASIC,
		SKILL_WEAPONS	= SKILL_BASIC,
		SKILL_HAULING  = SKILL_BASIC
	)
	max_skill = list(
		SKILL_COMBAT	= SKILL_MAX,
		SKILL_WEAPONS	= SKILL_MAX
	)
	skill_points = 20
	event_categories = list(ASSIGNMENT_SECURITY)

/datum/job/tradepost_security/head
	title = "Sheriff"
	supervisors = "justice"
	outfit_type = /decl/hierarchy/outfit/job/tradepost/security/head
	head_position = 1
	department_types = list(
		/decl/department/command,
		/decl/department/security
	)
	total_positions = 1
	spawn_positions = 1
	selection_color = COLOR_BLOOD_HUMAN
	req_admin_notify = 1
	minimal_player_age = 14
	economic_power = 10
	ideal_character_age = 50
	guestbanned = 1
	not_random_selectable = 1
	access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway
	)
	minimal_access = list(
		access_security,
		access_sec_doors,
		access_brig,
		access_forensics_lockers,
		access_heads,
		access_medical,
		access_engine,
		access_change_ids,
		access_ai_upload,
		access_eva,
		access_bridge,
		access_all_personal_lockers,
		access_maint_tunnels,
		access_bar,
		access_janitor,
		access_construction,
		access_morgue,
		access_crematorium,
		access_kitchen,
		access_cargo,
		access_cargo_bot,
		access_mailsorting,
		access_qm,
		access_hydroponics,
		access_lawyer,
		access_chapel_office,
		access_library,
		access_research,
		access_mining,
		access_heads_vault,
		access_mining_station,
		access_hop,
		access_RC_announce,
		access_keycard_auth,
		access_gateway
	)
	min_skill = list(
		SKILL_LITERACY = SKILL_BASIC,
		SKILL_COMBAT	= SKILL_ADEPT,
		SKILL_WEAPONS	= SKILL_ADEPT,
		SKILL_HAULING  = SKILL_ADEPT
	)
	max_skill = list(
		SKILL_COMBAT	= SKILL_MAX,
		SKILL_WEAPONS	= SKILL_MAX
	)
	skill_points = 30
	alt_titles = list()
