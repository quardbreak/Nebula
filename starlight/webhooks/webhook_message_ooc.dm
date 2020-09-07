/decl/webhook/message_ooc
	id = "webhook_message_ooc"

// Data expects "message_time", "client_key" and "client_message" fields.
/decl/webhook/message_ooc/get_message(list/data)
	. = ..()
	.["content"] = "`\[[data["message_time"]]\]` **OOC: [data["client_key"]]:** [data["client_message"]]"
