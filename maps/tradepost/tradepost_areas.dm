/datum/event/prison_break/medical
	areaType = list(/area/ship/post/medbay)

/datum/event/prison_break/station
	areaType = list(/area/ship/post/security/prison)

/area/ship/post
	name = "\improper Tradepost"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

//Hallways

/area/ship/post/hall
	name = "Central Docking Hallway"

/area/ship/post/hall/port
	name = "Port Ring Hallway"

/area/ship/post/hall/starboard
	name = "Starboard Ring Hallway"

/area/ship/post/hall/aft
	name = "Aft Ring Hallway"

/area/ship/post/hall/fore
	name = "Fore Ring Hallway"

/area/ship/post/dock/port
	name = "Port Docking Pylon"

/area/ship/post/dock/port/aft
	name = "Aft Port Docking Pylon"

/area/ship/post/dock/port/fore
	name = "Fore Port Docking Pylon"

/area/ship/post/dock/starboard
	name = "Starboard Docking Pylon"

/area/ship/post/dock/starboard/aft
	name = "Aft Starboard Docking Pylon"

/area/ship/post/dock/starboard/fore
	name = "Fore Starboard Docking Pylon"

/area/ship/post/dock/port
	name = "Port Primary Dock"

/area/ship/post/dock/starboard
	name = "Starboard Primary Dock"

//Crew

/area/ship/post/garden
	name = "\improper Garden"
	icon_state = "garden"

/area/ship/post/dorms
	icon_state = "green"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/post/dorms/saloon
	name = "\improper Crew Cabins"

/area/ship/post/saloon
	name = "\improper Saloon"
	icon_state = "conference"

/area/ship/post/toilets
	name = "\improper Bathrooms"
	icon_state = "toilet"
	turf_initializer = /decl/turf_initializer/maintenance

/area/ship/post/cryo
	name = "\improper Cryogenic Storage"
	icon_state = "cryo"

/area/ship/post/cryo/aux
	name = "\improper Auxiliary Cryogenic Storage"
	turf_initializer = /decl/turf_initializer/maintenance

//Medbay

/area/ship/post/medbay
	name = "\improper Medical Bay"
	icon_state = "medbay"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/post/medbay/chemistry
	name = "\improper Chemistry Bay"
	icon_state = "cave"
	req_access = list(access_medical)

//Misc

/area/ship/post/eva
	name = "\improper EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)

//Command

/area/ship/post/command
	name = "\improper Abandoned Bridge"
	icon_state = "bridge"
	req_access = list(access_bridge)

/area/ship/post/command/port
	name = "\improper Port Docking Office"
	icon_state = "green"

/area/ship/post/command/starboard
	name = "\improper Starboard Docking Office"
	icon_state = "purple"

//Maint

/area/ship/post/maintenance
	name = "\improper Maintenance Compartments"
	icon_state = "amaint"
	turf_initializer = /decl/turf_initializer/maintenance
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	req_access = list(access_maint_tunnels)

/area/ship/post/maintenance/janitor
	name = "\improper Janitor Closet"

/area/ship/post/maintenance/disposal
	name = "\improper Disposals"

//Engineering

/area/ship/post/engineering
	name = "\improper Engineering Bay"
	icon_state = "engine"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambieng1.ogg')
	req_access = list(access_engine)

/area/ship/post/engineering/reactor
	name = "\improper Reactor Bay"
	icon_state = "yellow"

/area/ship/post/engineering/storage
	name = "\improper Engineering Storage"
	icon_state = "engineering_storage"

/area/ship/post/engineering/atmos
	name = "\improper Atmospherics Compartment"
	icon_state = "atmos"

/area/ship/post/engineering/power
	name = "\improper Power Compartment"
	icon_state = "engine_smes"

/area/ship/post/engineering/monitoring
	name = "\improper Engineering Monitoring"
	icon_state = "engine_monitoring"

/area/ship/post/engineering/workshop
	name = "\improper Engineering Workshop"
	icon_state = "engineering_workshop"

//Security

/area/ship/post/security
	name = "\improper Security"
	icon_state = "security"
	req_access = list(access_security)

/area/ship/post/security/locker
	name = "\improper Security Locker Room"
	icon_state = "security_sub"

/area/ship/post/security/breakrooom
	name = "\improper Deputy Break Room"
	icon_state = "Tactical"

/area/ship/post/security/armory
	name = "\improper Armory"
	icon_state = "armory"
	req_access = list(access_armory)

/area/ship/post/security/prison
	name = "\improper Prison"
	icon_state = "sec_prison"
	area_flags = AREA_FLAG_RAD_SHIELDED
	req_access = list(access_brig)

//Lift

/area/turbolift/alert_on_fall(var/mob/living/carbon/human/H)
	if(H.client && SSpersistence.elevator_fall_shifts > 0)
		SSwebhooks.send(WEBHOOK_ELEVATOR_FALL, list("text" = "We managed to make it [SSpersistence.elevator_fall_shifts] shift\s without someone falling down an elevator shaft."))
		SSpersistence.elevator_fall_shifts = -1

/area/turbolift/tradepost
	name = "\improper Elevator"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = TRUE
	sound_env = STANDARD_STATION
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	arrival_sound = null
	lift_announce_str = null

/area/turbolift/tradepost/lower
	name = ""
	base_turf = /turf/simulated/floor/

/area/turbolift/tradepost/middle
	name = ""
	base_turf = /turf/simulated/open

/area/turbolift/tradepost/upper
	name = ""
	base_turf = /turf/simulated/open

/*
/area/ship/post/maintenance/engine/aft
	name = "\improper Main Engine Bay"

/area/ship/post/maintenance/engine/port
	name = "\improper Port Thruster"

/area/ship/post/maintenance/engine/starboard
	name = "\improper Starboard Thruster"

/area/ship/post/command/hallway
	name = "\improper Command Deck"
	icon_state = "centcom"

/area/ship/post/command/bridge
	name = "\improper Bridge"
	icon_state = "bridge"
	req_access = list(access_heads)

/area/ship/post/command/captain
	name = "\improper Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_captain)
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/post/command/fmate
	name = "\improper First Mate's Office"
	icon_state = "heads_hop"
	req_access = list(access_hop)

/area/ship/post/shieldbay
	name = "\improper Auxillary Shield Bay"
	icon_state = "engine"
	req_access = list(access_engine_equip)

/area/ship/post/command/bridge_upper
	name = "\improper Upper Bridge"
	icon_state = "blue"
	req_access = list(access_heads)

/area/ship/post/comms
	name = "\improper Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/signal.ogg','sound/ambience/sonar.ogg')

/area/ship/post/bridge_unused
	name = "\improper Bridge Starboard Storage"
	icon_state = "armory"

/area/ship/post/shuttle
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/post/shuttle/outgoing
	name = "\improper Exploration Shuttle"
	icon_state = "tcomsatcham"

/area/ship/post/maintenance/solars
	name = "\improper Solar Array Access"
	icon_state = "SolarcontrolA"
	req_access = list(access_engine)

/area/ship/post/artifact_storage
	name = "\improper Artifact Storage"
	icon_state = "ai_cyborg"
	req_access = list(access_xenoarch)

/area/ship/post/drunk_tank
	name = "Drunk Tank"
	icon_state = "brig"
	req_access = list(access_brig)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_SECURITY

/area/turbolift
	name = "\improper Command Elevator"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = TRUE
	sound_env = STANDARD_STATION
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	arrival_sound = null
	lift_announce_str = null

/area/turbolift/alert_on_fall(var/mob/living/carbon/human/H)
	if(H.client && SSpersistence.elevator_fall_shifts > 0)
		SSwebhooks.send(WEBHOOK_ELEVATOR_FALL, list("text" = "We managed to make it [SSpersistence.elevator_fall_shifts] shift\s without someone falling down an elevator shaft."))
		SSpersistence.elevator_fall_shifts = -1

/area/turbolift/tradepost_enclave
	name = "Disused Sublevel"
	base_turf = /turf/simulated/floor

/area/turbolift/tradepost_cargo
	name = "Lower Cargo Bay"
	base_turf = /turf/simulated/open

/area/turbolift/tradepost_upper
	name = "Upper Cargo Bay"
	base_turf = /turf/simulated/open

/area/turbolift/tradepost_roof
	name = "Solar Array Access"
	base_turf = /turf/simulated/open
*/