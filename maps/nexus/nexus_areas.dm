/area/nexus
	name = "\improper Nexus Area"
	holomap_color = HOLOMAP_AREACOLOR_CREW
	ambience = list(
		'sound/ambience/ambigen3.ogg',
		'sound/ambience/ambigen4.ogg',
		'sound/ambience/ambigen5.ogg',
		'sound/ambience/ambigen6.ogg',
		'sound/ambience/ambigen7.ogg',
		'sound/ambience/ambigen8.ogg',
		'sound/ambience/ambigen9.ogg',
		'sound/ambience/ambigen10.ogg',
		'sound/ambience/ambigen11.ogg',
		'sound/ambience/ambigen12.ogg'
	)


// Engineering

/area/nexus/engineering
	name = "\improper Engineering Office"
	holomap_color = HOLOMAP_AREACOLOR_ENGINEERING
	req_access = list(access_engine)
	ambience = list(
		'sound/ambience/ambigen3.ogg',
		'sound/ambience/ambigen4.ogg',
		'sound/ambience/ambigen5.ogg',
		'sound/ambience/ambigen6.ogg',
		'sound/ambience/ambigen7.ogg',
		'sound/ambience/ambigen8.ogg',
		'sound/ambience/ambigen9.ogg',
		'sound/ambience/ambigen10.ogg',
		'sound/ambience/ambigen11.ogg',
		'sound/ambience/ambieng1.ogg'
	)

/area/nexus/engineering/reactor
	name = "\improper Reactor Bay"

/area/nexus/engineering/power
	name = "\improper Power Distribution"

/area/nexus/engineering/storage
	name = "\improper Engineering Storage"

/area/nexus/engineering/fabrication
	name = "\improper Fabrication Bay"

/area/nexus/engineering/atmospherics
	name = "\improper Atmospherics Support"

/area/nexus/engineering/monitoring
	name = "\improper Engineering Monitoring"

// Bridge

/area/nexus/command
	name = "\improper Bridge"
	req_access = list(access_bridge)

/area/nexus/command/port
	name = "\improper Port Office"

/area/nexus/command/starboard
	name = "\improper Starboard Office"

// Coridors

/area/nexus/hallway
	name = "\improper Central Hallway"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/nexus/hallway/port
	name = "\improper Port Docking Pylon"

/area/nexus/hallway/starboard
	name = "\improper Starboard Docking Pylon"

/area/nexus/hallway/port/aft
	name = "\improper Aft Port Docking Pylon"

/area/nexus/hallway/starboard/aft
	name = "\improper Aft Starboard Docking Pylon"

/area/nexus/hallway/port/fore
	name = "\improper Fore Port Docking Pylon"

/area/nexus/hallway/starboard/fore
	name = "\improper Fore Starboard Docking Pylon"

// Civilian

/area/nexus/civilian
	name = "\improper Cryogenic Storage"

/area/nexus/civilian/bar
	name = "\improper Saloon"

/area/nexus/civilian/hygiene
	name = "\improper Hygiene Compartment"

/area/nexus/civilian/dormitory
	name = "\improper Dormitory"

// Maintenance

/area/nexus/maintenance
	name = "\improper Maintenance Compartments"
	icon_state = "amaint"
	turf_initializer = /decl/turf_initializer/maintenance
	forced_ambience = list('sound/ambience/maintambience.ogg')
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_MAINTENANCE
	sound_env = TUNNEL_ENCLOSED
	req_access = list(access_maint_tunnels)

/area/nexus/maintenance/custodial
	name = "\improper Cleaning Supplies"

/area/nexus/maintenance/disposal
	name = "\improper Disposal Processing"

