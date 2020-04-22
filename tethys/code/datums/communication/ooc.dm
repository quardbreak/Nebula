/decl/communication_channel/ooc/do_communicate(client/C, message)
	..()
	SSwebhooks.send("webhook_message_ooc", list("client_key" = C.key, "client_message" = message))