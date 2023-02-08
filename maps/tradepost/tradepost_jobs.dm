/datum/map/tradepost
	default_job_type = /datum/job/tradepost_laborer
	default_department_type = /decl/department/civilian
	default_law_type = /datum/ai_laws/corporate
	id_hud_icons = 'maps/tradepost/hud.dmi'
	allowed_jobs = list(
		/datum/job/tradepost_laborer,
		/datum/job/tradepost_captain,
		/datum/job/tradepost_security/head,
		/datum/job/tradepost_security,
		/datum/job/tradepost_doctor/head,
		/datum/job/tradepost_doctor,
		/datum/job/tradepost_engineer/head,
		/datum/job/tradepost_engineer
	)