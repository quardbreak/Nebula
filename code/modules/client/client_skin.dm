/client/proc/force_theme_white()
	set background = TRUE

	winset(src, null, {"
	infowindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	infowindow.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	rpane.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	rpane.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	info.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	info.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	outputwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	outputwindow.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	rpanewindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	rpanewindow.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	mainwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	split.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	mainvsplit.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];

	textb.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	textb.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	infob.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	infob.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	rulesb.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	rulesb.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	Lore.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	Lore.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	wikib.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	wikib.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	forumb.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	forumb.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	changelog.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	changelog.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	github.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	github.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	BugReport.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	BugReport.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	hotkey_toggle.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	hotkey_toggle.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];

	output.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	output.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	outputwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	outputwindow.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	statwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	statwindow.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	info.background-color = [SKIN_THEME_COLOR_BACKGROUND_WHITE];
	info.tab-background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	info.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	info.tab-text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	info.prefix-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	info.suffix-color = [SKIN_THEME_COLOR_TEXT_BLACK];

	saybutton.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	saybutton.text-color = [SKIN_THEME_COLOR_TEXT_BLACK];
	asset_cache_browser.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	asset_cache_browser.background-color = [SKIN_THEME_COLOR_BACKGROUND_NONE];
	"})

/client/proc/force_theme_dark()
	set background = TRUE

	winset(src, null, {"
	infowindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	infowindow.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	rpane.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	rpane.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	info.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	info.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	browseroutput.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	browseroutput.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	outputwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	outputwindow.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	rpanewindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	rpanewindow.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	mainwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	split.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	mainvsplit.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];

	textb.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	textb.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	infob.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	infob.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	rulesb.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	rulesb.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	Lore.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	Lore.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	wikib.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	wikib.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	forumb.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	forumb.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	changelog.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	changelog.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	github.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	github.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	BugReport.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	BugReport.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	hotkey_toggle.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	hotkey_toggle.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];

	output.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARKEST];
	output.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	outputwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARKEST];
	outputwindow.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	statwindow.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARKEST];
	statwindow.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	info.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARKEST];
	info.tab-background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	info.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	info.tab-text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	info.prefix-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	info.suffix-color = [SKIN_THEME_COLOR_TEXT_CYAN ];

	saybutton.background-color = [SKIN_THEME_COLOR_BACKGROUND_GRAY];
	saybutton.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	asset_cache_browser.background-color = [SKIN_THEME_COLOR_BACKGROUND_DARK];
	asset_cache_browser.text-color = [SKIN_THEME_COLOR_TEXT_CYAN ];
	"})
