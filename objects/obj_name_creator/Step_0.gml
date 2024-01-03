#region MOVE THE CURSOR
	if (!button_ready){
		if (global.hd || global.hl || global.hr || global.hu){
			button_timer++;
		}
		
		if (button_timer >= time_till_button_ready){
			button_timer = 0;
			button_ready = true;
		}
		
		if (global.pd || global.pl || global.pr || global.pu){
			button_timer = 0;
			button_ready = true;
		}
	}
	
	if (global.rd || global.rl || global.rr || global.ru){
		button_timer = 0;
		button_ready = false;
	}
	
	if(button_ready){
		if (global.pl or global.hl){
		//audio
		if (!global.pr and !global.hr){
			audio_play_sound(snd_typewriter, 5, false);
		}
		if (grid_x = 9 and grid_y = 2) grid_x = 5;
		else if (grid_x - 1) < 0 grid_x = (x_letters - 1);
		else grid_x --;
		}
	
		if (global.pr or global.hr){
		if (!global.pl and !global.hl){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (grid_x = 5 and grid_y = 2) grid_x = 9;
			else if (grid_x + 1) >= x_letters grid_x = 0;
			else grid_x ++;
		}
	
		if (global.pu or global.hu){
		if (!global.pd and !global.hd and !global.hl and !global.hr and !global.pl and !global.pr){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (grid_y = 0 and grid_x > 5 and grid_x != 9) grid_y = 1;
			else if (grid_y - 1) < 0 grid_y = (y_letters - 1);
			else grid_y --;
		}
	
		if (global.pd or global.hd){
		if (!global.pu and !global.hu and !global.hl and !global.hr and !global.pl and !global.pr){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (grid_y = 1 and grid_x > 5 and grid_x != 9) grid_y = 0;
			else if (grid_y + 1) >= y_letters grid_y = 0;
			else grid_y ++;
		}
		
		button_ready = false;
		
}



#endregion

#region prESSED OK

if (global.pok){
	var new_letter = a_letters[grid_x, grid_y];
	
	//Save the new name to the hero
	if (new_letter == "OK" and current_name != ""){
		global.player_name = current_name;
		audio_play_sound(snd_select, 5, false);
		instance_destroy(obj_textbox);
		instance_destroy(obj_ev_intro);
		if (!instance_exists(obj_ev_intro_2)){
			instance_create_layer(0,0, "Instances", obj_ev_intro_2);
		} else {
			instance_destroy(obj_ev_intro_2);
			instance_create_layer(0,0, "Instances", obj_ev_intro_2);
		}
		instance_destroy(self);
	} else if(new_letter == "OK" and current_name == ""){
		audio_play_sound(snd_buzz, 6, false);
	}
	
	//Check if we're at max letters for the name or not
	letter_count = string_length(current_name);
		
	//Add letter to name (check if it's not the OK button before adding)
	if ((new_letter != "OK") and (letter_count < MAX_LETTERS_IN_NAME) and new_letter != " "){
		audio_play_sound(snd_select, 5, false);
		
		//CHANGE TO LOWER CASE IF NEEDED
		if (show_lower_case) and (new_letter != " "){
			uni_code = ord(new_letter) + 32;
			new_letter = chr(uni_code);
		}
		
		current_name += new_letter;
	} else if (letter_count >= MAX_LETTERS_IN_NAME) {
		audio_play_sound(snd_buzz, 6, false);
	}
	
}
#endregion

#region prESSED CANCEL

if (global.pcan){
	//audio
	audio_play_sound(global.s_back, 5, false);
	
	//Check we have at least 1 letter in the name
	letter_count = string_length(current_name);
	
	//If we have at least 1, delete it
	if (letter_count >= 1) current_name = string_delete(current_name, letter_count, 1);
}

#endregion

#region CHANGE CAPITALISATION

if (string_length(current_name) = 0){
	show_lower_case = false;
} else {
	show_lower_case = true;
}

#endregion