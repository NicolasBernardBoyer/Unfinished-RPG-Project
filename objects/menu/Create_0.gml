enum menu_page {
	main,
	settings,
	audio,
	difficulty,
	graphics,
	controls,
	height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//CREATE MENU PAGES
#region
ds_menu_main = create_menu_page(
	["Resume",		menu_element_type.script_runner,	resume_game],
	["Settings",	menu_element_type.page_transfer,	menu_page.settings],
	["Exit",		menu_element_type.script_runner,	exit_game]
);

ds_settings = create_menu_page(
	["Audio",		menu_element_type.page_transfer,	menu_page.audio],
	["Difficulty",  menu_element_type.page_transfer,	menu_page.difficulty],
	["Graphics",	menu_element_type.page_transfer,	menu_page.graphics],
	["Controls",	menu_element_type.page_transfer,	menu_page.controls],
	["Back",		menu_element_type.page_transfer,	menu_page.main],
);

ds_menu_audio = create_menu_page(
	["Master",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["Sounds",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["Music",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["Back",		menu_element_type.page_transfer,	menu_page.settings],
);

ds_menu_difficulty = create_menu_page(
	["Select Difficulty", menu_element_type.shift,		   change_difficulty,		0,		["EASY", "NORMAL", "HARD"]],
	["Back",			  menu_element_type.page_transfer, menu_page.settings],
);

ds_menu_graphics = create_menu_page(
	["Resolution", menu_element_type.shift,				change_resolution,		0,		["320 x 240", "640 x 480", "960 x 720", "1280 x 960"]],
	["Window Mode",menu_element_type.toggle,			change_window_mode,		1,		["FULLSCREEN", "WINDOWED"]],
	["Back",	   menu_element_type.page_transfer,		menu_page.settings],
);

ds_menu_controls = create_menu_page(
	["Up",		   menu_element_type.input,			"key_up",			vk_up],
	["Left",	   menu_element_type.input,			"key_left",			vk_left],
	["Right",	   menu_element_type.input,			"key_right",		vk_right],
	["Down",	   menu_element_type.input,			"key_down",			vk_down],
	["Back",	   menu_element_type.page_transfer, menu_page.settings],
);

page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

#endregion