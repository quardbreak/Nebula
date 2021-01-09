/area/ship/trade
	name = "Generic Ship"
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')

/*
please do not remove my messages. they just look fancy to sort these areas. i rly dont like previous file. i know that it was sorted by area placement but..
*/

//Crew/Civilian

/area/ship/trade/crew
	name = "Crew Compartments"
	icon_state = "crew_quarters"

/area/ship/trade/crew/hallway/port
	name = "Crew Hallway - Port"

/area/ship/trade/crew/hallway/starboard
	name = "Crew Hallway - Starboard"

/area/ship/trade/crew/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/ship/trade/crew/hydro
	name = "Hydroponics"
	icon_state = "green"

/area/ship/trade/crew/dorms1
	name = "Sleep Capsule"
	icon_state = "green"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/trade/crew/dorms2
	name = "Crew Cabin"
	icon_state = "purple"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/trade/crew/saloon
	name = "Saloon"
	icon_state = "conference"

/area/ship/trade/crew/library
	name = "Library"
	icon_state = "yellow"

/area/ship/trade/crew/toilets
	name = "Bathrooms"
	icon_state = "toilet"

/area/ship/trade/crew/wash
	name = "Laundry"
	icon_state = "locker"

//Docks

/area/ship/trade/dock
	name = "Docking Bay"
	icon_state = "entry_1"

/area/ship/trade/shuttle
	name = "Exploration Shuttle"
	icon_state = "tcomsatcham"
	area_flags = AREA_FLAG_RAD_SHIELDED

//Escape Pods/Cryo

/area/ship/trade/escape_port
	name = "Port Escape Pods"
	icon_state = "green"

/area/ship/trade/escape_star
	name = "Starboard Escape Pods"
	icon_state = "yellow"

//Command

/area/ship/trade/command
	req_access = list(access_heads)

/area/ship/trade/command/hallway
	name = "Command Deck"
	icon_state = "centcom"
	req_access = list()

/area/ship/trade/command/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/ship/trade/command/bridge_upper
	name = "Upper Bridge"
	icon_state = "blue"

/area/ship/trade/command/captain
	name = "Captain's Quarters"
	icon_state = "captain"
	req_access = list(access_captain)

/area/ship/trade/command/fmate
	name = "First Mate's Office"
	icon_state = "heads_hop"
	req_access = list(access_hop)

//Medical

/area/ship/trade/medical
	name = "Medical Bay"
	icon_state = "medbay"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/trade/medical/chemistry
	name = "Chemistry Bay"
	icon_state = "cave"
	req_access = list(access_medical)

//Science

/area/ship/trade/science
	name = "Research Bay"
	icon_state = "green"
	req_access = list(access_research)

/area/ship/trade/science/fabricaton
	name = "Fabrication Bay"
	icon_state = "yellow"

/area/ship/trade/science/artifact_storage
	name = "Artifact Storage"
	icon_state = "ai_cyborg"

//Cargo

/area/ship/trade/cargo
	name = "Cargo Hold"
	icon_state = "quartstorage"
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/trade/cargo/lower
	name = "Loading Bay"

//Maint. and unused

/area/ship/trade/maintenance
	name = "Maintenance Compartments"
	icon_state = "amaint"

/area/ship/trade/maintenance/hallway
	name = "Maintenance Corridors"

/area/ship/trade/maintenance/lower
	name = "Lower Deck Maintenance Compartments"
	icon_state = "sub_maint_aft"

/area/ship/trade/hidden
	name = "Unknown"
	icon_state = "auxstorage"

/area/ship/trade/command/bridge_unused
	name = "Bridge Starboard Storage"
	icon_state = "armory"

//Engineering

/area/ship/trade/engineering
	name       = "Engineering Bay"
	icon_state = "engineering_supply"
	req_access = list(access_engine)
	secure     = 1

	ambience = list('sound/ambience/ambigen3.ogg',
					'sound/ambience/ambigen4.ogg',
					'sound/ambience/ambigen5.ogg',
					'sound/ambience/ambigen6.ogg',
					'sound/ambience/ambigen7.ogg',
					'sound/ambience/ambigen8.ogg',
					'sound/ambience/ambigen9.ogg',
					'sound/ambience/ambigen10.ogg',
					'sound/ambience/ambigen11.ogg',
					'sound/ambience/ambieng1.ogg')

/area/ship/trade/engineering/storage
	name = "Engineering Storage"
	icon_state = "engineering_storage"

/area/ship/trade/engineering/techstorage
	name = "Parts Storage"
	icon_state = "engineering_supply"

/area/ship/trade/engineering/eva
	name = "EVA Storage"
	icon_state = "eva"
	req_access = list(access_eva)

/area/ship/trade/engineering/atmos
	name = "Atmospherics Comparment"
	icon_state = "atmos"

/area/ship/trade/engineering/power
	name = "Power Compartment"
	icon_state = "engine_smes"

/area/ship/trade/engineering/engine
	name = "Main Engine Bay"
	icon_state = "engine"

/area/ship/trade/engineering/solars
	name = "Solar Array Access"
	icon_state = "SolarcontrolA"

//Misc.

/area/ship/trade/brig
	name = "Brig"
	icon_state = "brig"
	req_access = list(access_brig)
	secure     = 1
	area_flags = AREA_FLAG_RAD_SHIELDED

/area/ship/trade/storage
	name = "Secure Storage"
	icon_state = "engine"
	req_access = list(access_engine_equip)

/area/ship/trade/comms
	name = "Communications Relay"
	icon_state = "tcomsatcham"
	ambience = list('sound/ambience/ambigen3.ogg',
					'sound/ambience/ambigen4.ogg',
					'sound/ambience/signal.ogg',
					'sound/ambience/sonar.ogg')
	req_access = list(access_engine)

//Underside.

/area/ship/trade/aft_port_underside_maint
	name = "Underside - Aft Port Maintenance"
	icon_state = "medbay"

/area/ship/trade/aft_starboard_underside_maint
	name = "Underside - Aft Starboard Maintenance"
	icon_state = "toilet"

/area/ship/trade/loading_bay
	name = "Underside - Loading Bay"
	icon_state = "entry_1"

/area/ship/trade/fore_port_underside_maint
	name = "Underside - Fore Port Maintenance"
	icon_state = "green"

/area/ship/trade/livestock
	name = "Underside - Livestock Handling"
	icon_state = "red"
	req_access = list(access_xenobiology)

/area/ship/trade/fore_starboard_underside_maint
	name = "Underside - Fore Starboard Maintenance"
	icon_state = "locker"

/area/ship/trade/bar
	name = "Underside - Bar"
	icon_state = "yellow"

/area/ship/trade/undercomms
	name = "Underside - Communications Relay"
	icon_state = "blue"

//Elevator

/area/turbolift
	name = "Cargo Elevator"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	sound_env = STANDARD_STATION
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	ambience = list('sound/ambience/ambigen3.ogg','sound/ambience/ambigen4.ogg','sound/ambience/ambigen5.ogg','sound/ambience/ambigen6.ogg','sound/ambience/ambigen7.ogg','sound/ambience/ambigen8.ogg','sound/ambience/ambigen9.ogg','sound/ambience/ambigen10.ogg','sound/ambience/ambigen11.ogg','sound/ambience/ambigen12.ogg')
	arrival_sound = null
	lift_announce_str = null

/area/turbolift/alert_on_fall(var/mob/living/carbon/human/H)
	if(H.client && SSpersistence.elevator_fall_shifts > 0)
		SSwebhooks.send(WEBHOOK_ELEVATOR_FALL, list("text" = "We managed to make it [SSpersistence.elevator_fall_shifts] shift\s without someone falling down an elevator shaft."))
		SSpersistence.elevator_fall_shifts = -1

/area/turbolift/constellation_enclave
	name = "Disused Sublevel"
	base_turf = /turf/simulated/floor

/area/turbolift/constellation_cargo
	name = "Lower Cargo Bay"
	base_turf = /turf/simulated/open

/area/turbolift/constellation_upper
	name = "Upper Cargo Bay"
	base_turf = /turf/simulated/open

/area/turbolift/constellation_roof
	name = "Solar Array Access"
	base_turf = /turf/simulated/open