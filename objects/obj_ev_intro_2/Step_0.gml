// If name hasn't been confirmed, prompt user to confirm 
if (!instance_exists(obj_textbox) and run_text_2 = false){
	create_textbox(pre_text, pre_speakers, pre_next_line, pre_scripts);
// If the user has confirmed, prompt the user to enter difficulty
} else if (!instance_exists(obj_textbox) and run_text_2 = true){
	create_textbox(text, speakers, next_line, scripts);
	run_text_2 = false;
}

// Have a delay before displaying difficulty to the player
if (draw_difficulty = true){
	delay = time_source_create(time_source_game, 10, time_source_units_frames, function(){
		if (delay_check != false){
			delay_check = false;
		}
		time_source_stop(delay);
	});
	time_source_start(delay);
	
	// prevent player from progressing in the textbox
	obj_textbox.proceed = false;
	if (delay_check != true){
		// If the delay is gone, here is the code to switch between difficulties
		// press right and press left
		if (global.pr){
			if (difficulty_page < 2){
				difficulty_page++;
				audio_play_sound(snd_typewriter, 5, false);
			}
		}
		if (global.pl){
			if (difficulty_page > 0){
				difficulty_page--;
				audio_play_sound(snd_typewriter, 5, false);
			}
		}
		// press OK and choose a difficulty
		if (global.pok){
			// make the textbox proceed as usual, go one dialogue further
			obj_textbox.proceed = true;
			obj_textbox.page += 1;

			// Set difficulty to what is chosen
			global.difficulty_set = difficulty_page;
			draw_difficulty = false;
			confirm_difficulty = true;
			instance_destroy(obj_textbox);
			// play the last textbox in the cutscene
			create_textbox(text2, speakers2, next_line2, scripts2);
		}
	}
} else {
	difficulty_page = 0;
}