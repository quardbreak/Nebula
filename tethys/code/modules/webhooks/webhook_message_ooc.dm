/decl/webhook/message_ooc
	id = "webhook_message_ooc"

// Data expects a "text" field containing a message.
/decl/webhook/message_ooc/get_message(list/data)
	. = ..()
	.["content"] = "`\[[time2text(world.realtime, "hh:mm:ss")]\]` **OOC: [data["client_key"]]:** [data["client_message"]]"
