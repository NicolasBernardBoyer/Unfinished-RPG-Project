
if(keyboard_check_pressed(interact_key) or keyboard_check_pressed(other_interact_key) or gamepad_button_check_pressed(0,interact_button)){
	
	if(!choice_dialogue and counter < str_len){ counter = str_len; }
	else if(page < array_length_1d(text) - 1){
		
		event_perform(ev_other, ev_user2);

		var line = next_line[page];
		if(choice_dialogue) line = line[choice];
		
		if(line == 0) page++;
		else if(line == -1){ instance_destroy(); exit; }
		else page = line;
		
		event_perform(ev_other, ev_user1);
		
	} else { instance_destroy(); }
}

if(choice_dialogue){
	if (keyboard_check_pressed(global.key_down) or keyboard_check_pressed(global.key_up)){
		audio_play_sound(snd_typewriter, 5, false);
	}
	
	choice += keyboard_check_pressed(global.key_down) - keyboard_check_pressed(global.key_up);
	
	if(choice > text_array_len-1) choice = 0;
	if(choice < 0) choice = text_array_len-1;
}