//get inputs (already done in obj_game)
if (!obj_ev_title_screen.title_menu) exit;

// start the alarm to let the player press options
if(alarm[0] < 0){
	if (obj_ev_title_screen.title_menu and canpress = false){
		alarm[0] = 10;
	}
}

if (canpress = true){
	//move through the obj_menu
	pos += global.pd - global.pu;
	if pos >= op_length {pos = 0};
	if pos < 0 {pos = op_length-1};

	if (global.pd and !global.pu){
		audio_play_sound(global.s_typewriter, 5, false);
	}

	else if (global.pu and !global.pd){
		audio_play_sound(global.s_typewriter, 5, false);
	}

	if (global.pok){
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
