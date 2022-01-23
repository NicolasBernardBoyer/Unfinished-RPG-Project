if(!global.pause) exit;

input_up_p		 = keyboard_check_pressed(global.key_up);
input_down_p	 = keyboard_check_pressed(global.key_down);
input_confirm_p  = keyboard_check_pressed(global.key_confirm);
input_enter_p    = keyboard_check_pressed(global.key_enter);
input_revert_p	 = keyboard_check_pressed(global.key_revert);

var ds_grid = page, ds_height = ds_grid_height(ds_grid);

var ochange = input_down_p - input_up_p;
if(ochange != 0){
	menu_option[page] += ochange;
	if(menu_option[page] > ds_height-1) { menu_option[page] = 0; }
	if(menu_option[page] < 0) { menu_option[page] = ds_height -1; }
	
}

if(input_enter_p or input_confirm_p){
	switch(ds_grid[# 1, menu_option[page]]){
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]]; break;
	}
	
	//audio
	audio_play_sound(snd_select, 0, false);
}