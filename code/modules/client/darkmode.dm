//Darkmode preference by Kmc2000//

/*
This lets you switch chat themes by using winset and CSS loading, you must relog to see this change (or rebuild your browseroutput datum)
Things to note:
If you change ANYTHING in interface/skin.dmf you need to change it here:
Format:
winset(src, "window as appears in skin.dmf after elem", "var to change = currentvalue;var to change = desired value")
How this works:
I've added a function to browseroutput.js which registers a cookie for darkmode and swaps the chat accordingly. You can find the button to do this under the "cog" icon next to the ping button (top right of chat)
This then swaps the window theme automatically
Thanks to spacemaniac and mcdonald for help with the JS side of this.
*/

/client/proc/force_white_theme() //There's no way round it. We're essentially changing the skin by hand. It's painful but it works, and is the way Lummox suggested.
	//Main windows
	winset(src, "infowindow", "background-color = [COLOR_DARKMODE_DARKBACKGROUND];background-color = none")
	winset(src, "infowindow", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "rpane", "background-color = [COLOR_DARKMODE_DARKBACKGROUND];background-color = none")
	winset(src, "rpane", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "info", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "info", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "browseroutput", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "browseroutput", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "outputwindow", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "outputwindow", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "rpanewindow", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "rpanewindow", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "mainwindow", "background-color = [COLOR_DARKMODE_DARKBACKGROUND];background-color = none")
	winset(src, "split", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "mainvsplit", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")

	//Buttons
	winset(src, "textb", "background-color = #494949;background-color = none")
	winset(src, "textb", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "infob", "background-color = #494949;background-color = none")
	winset(src, "infob", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "rulesb", "background-color = #494949;background-color = none")
	winset(src, "rulesb", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "Lore", "background-color = #494949;background-color = none")
	winset(src, "Lore", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "wikib", "background-color = #494949;background-color = none")
	winset(src, "wikib", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "forumb", "background-color = #494949;background-color = none")
	winset(src, "forumb", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "changelog", "background-color = #494949;background-color = none")
	winset(src, "changelog", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "github", "background-color = #494949;background-color = none")
	winset(src, "github", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "BugReport", "background-color = #494949;background-color = none")
	winset(src, "BugReport", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")

	//Status and verb tabs
	winset(src, "output", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "output", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "outputwindow", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "outputwindow", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "statwindow", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "statwindow", "text-color = #eaeaea;text-color = #000000")
	winset(src, "info", "background-color = [COLOR_DARKMODE_DARKBACKGROUND];background-color = #FFFFFF")
	winset(src, "info", "tab-background-color = [COLOR_DARKMODE_BACKGROUND];tab-background-color = none")
	winset(src, "info", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "info", "tab-text-color = [COLOR_DARKMODE_TEXT];tab-text-color = #000000")
	winset(src, "info", "prefix-color = [COLOR_DARKMODE_TEXT];prefix-color = #000000")
	winset(src, "info", "suffix-color = [COLOR_DARKMODE_TEXT];suffix-color = #000000")
	winset(src, "asset_cache_browser", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "asset_cache_browser", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")

	//Say, OOC, me Buttons etc.
	winset(src, "saybutton", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "saybutton", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "input", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "input", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "hotkey_toggle", "background-color = #494949;background-color = none")
	winset(src, "hotkey_toggle", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	// Alt
	winset(src, "saybutton_alt", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "saybutton_alt", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "input_alt", "background-color = [COLOR_DARKMODE_BACKGROUND];background-color = none")
	winset(src, "input_alt", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")
	winset(src, "hotkey_toggle_alt", "background-color = #494949;background-color = none")
	winset(src, "hotkey_toggle_alt", "text-color = [COLOR_DARKMODE_TEXT];text-color = #000000")

/client/proc/force_dark_theme() //Inversely, if theyre using white theme and want to swap to the superior dark theme, let's get WINSET() ing
	//Main windows
	winset(src, "infowindow", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "infowindow", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "rpane", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "rpane", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "info", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "info", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "browseroutput", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "browseroutput", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "outputwindow", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "outputwindow", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "rpanewindow", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "rpanewindow", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "mainwindow", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "split", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "mainvsplit", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")

	//Buttons
	winset(src, "textb", "background-color = none;background-color = #494949")
	winset(src, "textb", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "infob", "background-color = none;background-color = #494949")
	winset(src, "infob", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "rulesb", "background-color = none;background-color = #494949")
	winset(src, "rulesb", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "Lore", "background-color = none;background-color = #494949")
	winset(src, "Lore", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "wikib", "background-color = none;background-color = #494949")
	winset(src, "wikib", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "forumb", "background-color = none;background-color = #494949")
	winset(src, "forumb", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "changelog", "background-color = none;background-color = #494949")
	winset(src, "changelog", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "github", "background-color = none;background-color = #494949")
	winset(src, "github", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "BugReport", "background-color = none;background-color = #494949")
	winset(src, "BugReport", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")

	//Status and verb tabs
	winset(src, "output", "background-color = none;background-color = [COLOR_DARKMODE_DARKBACKGROUND]")
	winset(src, "output", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "outputwindow", "background-color = none;background-color = [COLOR_DARKMODE_DARKBACKGROUND]")
	winset(src, "outputwindow", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "statwindow", "background-color = none;background-color = [COLOR_DARKMODE_DARKBACKGROUND]")
	winset(src, "statwindow", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "info", "background-color = #FFFFFF;background-color = [COLOR_DARKMODE_DARKBACKGROUND]")
	winset(src, "info", "tab-background-color = none;tab-background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "info", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "info", "tab-text-color = #000000;tab-text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "info", "prefix-color = #000000;prefix-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "info", "suffix-color = #000000;suffix-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "asset_cache_browser", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "asset_cache_browser", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")

	//Say, OOC, me Buttons etc.
	winset(src, "saybutton", "background-color = none;background-color = #494949")
	winset(src, "saybutton", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "input", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "input", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "hotkey_toggle", "background-color = none;background-color = #494949")
	winset(src, "hotkey_toggle", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")

	//Alt
	winset(src, "saybutton_alt", "background-color = none;background-color = #494949")
	winset(src, "saybutton_alt", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "input_alt", "background-color = none;background-color = [COLOR_DARKMODE_BACKGROUND]")
	winset(src, "input_alt", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
	winset(src, "hotkey_toggle_alt", "background-color = none;background-color = #494949")
	winset(src, "hotkey_toggle_alt", "text-color = #000000;text-color = [COLOR_DARKMODE_TEXT]")
