/client/proc/reestablish_db_connection()
	set category = "Special Verbs"
	set name = "Reestablish DB Connection"

	if(!global.sqlenabled)
		to_chat(usr, SPAN_DANGER("The Database is not enabled!"))
		return

	if(dbcon && dbcon.IsConnected())
		var/reconnect = alert("The database is already connected! If you *KNOW* that this is incorrect, you can force a reconnection", "The database is already connected!", "Force Reconnect", "Cancel")
		if(reconnect != "Force Reconnect")
			return

		dbcon.Disconnect()
		global.failed_db_connections = 0
		log_and_message_admins("has forced the database to disconnect!")
		SSstatistics.add_field_details("admin_verb", "FRDB") // If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	log_and_message_admins("is attempting to re-established the DB Connection")
	SSstatistics.add_field_details("admin_verb", "RDB") // If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

	global.failed_db_connections = 0
	if(!establish_db_connection())
		message_admins("Database connection failed: " + dbcon.ErrorMsg())
	else
		message_admins("Database connection re-established")
