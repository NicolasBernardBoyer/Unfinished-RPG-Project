//get inputs (already done in obj_game)
if (!ev_title_screen.titleMenu) exit;

// start the alarm to let the player press options
if(alarm[0] < 0){
	if (ev_title_screen.titleMenu and canPress = false){
		alarm[0] = 10;
	}
}

if (canPress = true){
	//move through the menu
	pos += global.PD - global.PU;
	if pos >= op_length {pos = 0};
	if pos < 0 {pos = op_length-1};

	if (global.PD and !global.PU){
		audio_play_sound(global.s_typewriter, 5, false);
	}

	else if (global.PU and !global.PD){
		audio_play_sound(global.s_typewriter, 5, false);
	}

	if (global.POK){
		audio_play_sound(global.s_select, 5, false);
		switch(pos){
	
		//start game
		case 0:
			room_goto_next();
			break;
	
		//continue
		case 1:
		
			break;
		
		//settings
		case 2:
			room_goto(rm_title_settings);
			break;
		
		//quit game
		case 3:
			game_end();
			break;
		}
	}
}
