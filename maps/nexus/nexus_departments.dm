// Civilian

/decl/department/nexus/civilian
	name = "Civilian"
	display_priority = 1
	display_color = "#dddddd"

// Engineering

/decl/department/nexus/engineering
	name = "Engineering"
	announce_channel = "Engineering"
	colour = "#ffa500"
	display_priority = 2
	display_color = "#fff5cc"

/obj/item/robot_module/engineering
	associated_department = /decl/department/nexus/engineering

/obj/machinery/network/pager/engineering
	department = /decl/department/nexus/engineering

// Command

/decl/department/nexus/command
	name = "Command"
	colour = "#800080"
	display_priority = 4
	display_color = "#ccccff"

/obj/machinery/network/pager
	department = /decl/department/nexus/command

// Miscellaneous

/decl/department/nexus/miscellaneous
	name = "Miscellaneous"
	display_priority = -1
	display_color = "#ccffcc"
