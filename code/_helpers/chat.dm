/proc/to_chat(target, text, chat_type)
	var/list/output_target_list = list("chat_all.output")

	if(chat_type & CHAT_TYPE_PM)
		output_target_list += "chat_pm.output"

	if(chat_type & CHAT_TYPE_OOC)
		output_target_list += "chat_ooc.output"

	if(chat_type & CHAT_TYPE_LOOC)
		output_target_list += "chat_looc.output"

	for(var/output in output_target_list)
		send_output(target, text, output)
