//If you aren't pausing but you are in title settings, go to title screen instead
//of going back to the room
if(!global.pause and room = rm_title_settings) room_goto(rm_title_screen);

// If you aren't pausing, exit the menu
if(!global.pause) exit;

// If you can't pause in the first place, exit the menu
if(!global.canPause) exit;

// There is no main page for the title settings
// If you were to return to the main page in title settings, just unpause
if(room = rm_title_settings){
	if (page < 1){
		global.pause = false;
		global.canPause = false;
	}
}

//inputs for the menu
input_up_p		 = global.PU;
input_down_p	 = global.PD;
input_confirm_p  = global.POK;
input_enter_p    = global.PSEL;
input_revert_p	 = global.PCAN;

//create a grid based off the page and get the height for it
var ds_grid = page, ds_height = ds_grid_height(ds_grid);

//if (menu_pages[page] = ds_menu_difficulty and inputting = false and ds_grid[# 1, menu_option[page]] = menu_element_type.toggle){
//	ds_grid[# 3, menu_option[page]] = global.difficultySet;
//}

// If the player is inputting something
if(inputting){
	//depending on the menu option perform something different
	switch(ds_grid[# 1, menu_option[page]]){
		// show different choices for options
		case menu_element_type.shift:
			var hinput = global.PR - global.PL;
			if (hinput != 0){
				// audio
				audio_play_sound(snd_typewriter, 5, false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length_1d(ds_grid[# 4, menu_option[page]])-1);
			}
			
		break;
		// modify volume/other sliders
		case menu_element_type.slider:
			var hinput = global.HR - global.HL;
			if (hinput != 0){
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		
		break;
		// toggle certain options on and off
		case menu_element_type.toggle:
			var hinput = global.PR - global.PL;
			if (hinput != 0){
				// audio
				audio_play_sound(snd_typewriter, 5, false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		
		break;
		
		// modifying controls can be an option properly added later
		case menu_element_type.input:
		var kk = keyboard_lastkey;
		if(kk != vk_enter and kk != ord("Z") and kk != ord("X")){
			// audio
			if(kk != ds_grid[# 3, menu_option[page]]) audio_play_sound(snd_select, 5, false);
			ds_grid[# 3, menu_option[page]] = kk;
			variable_global_set(ds_grid[# 2, menu_option[page]], kk);
		}
			
		break;
	}
} else {
	// move the cursor up and down
	var ochange = input_down_p - input_up_p;
	if(ochange != 0){
		audio_play_sound(snd_typewriter, 5, false);
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
		if(menu_option[page] < 0) { menu_option[page] = ds_height -1; }
	}
	//go back a page or exit the menu after pressing back
		if (input_revert_p){
		//audio
		audio_play_sound(global.s_back, 5, false);
		if (page = 0) {
			global.pause = false;
		} else if (page = 1) {
			page--;
		} else {
			page = 1;
		}
	}
}

	// make modifications to the settings when user confirms
	if(input_enter_p or input_confirm_p){
		switch(ds_grid[# 1, menu_option[page]]){
			case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]); break;
			case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;

			case menu_element_type.shift:
			case menu_element_type.slider:
			case menu_element_type.toggle: if(inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
			case menu_element_type.input:
				inputting = !inputting;
				break;
		}
		//audio
		audio_play_sound(snd_select, 5, false);
	}
	