

// when pressing interact key (make this just one button) do this
if(global.POK or global.PCAN){
	if (proceed){
		// if text is done displaying, go to next page, otherwise, write out all the text
		if(!choice_dialogue and counter < str_len){ counter = str_len; }
		else if(page < array_length_1d(text) - 1){

			event_perform(ev_other, ev_user2);

			var line = next_line[page];
			if(choice_dialogue) line = line[choice];
			
			choice = 0;
		
			if(line == 0) page++;
			else if(line == -1){ instance_destroy(); exit; }
			else page = line;
		
			event_perform(ev_other, ev_user1);
		
		} else {  
			event_perform(ev_other, ev_user2); 
			instance_destroy(); 
		}
	}
}

// if there is choice dialogue, pressing up and down moves the selection
if(choice_dialogue){
	if (global.PU or global.PD){
		audio_play_sound(snd_typewriter, 5, false);
	}
	
	choice += global.PD - global.PU;
	
	if(choice > text_array_len-1) choice = 0;
	if(choice < 0) choice = text_array_len-1;
}