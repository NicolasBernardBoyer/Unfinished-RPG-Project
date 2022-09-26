
if (!instance_exists(obj_textbox)){
	create_textbox(text, speakers, next_line, scripts);
}

if (draw_difficulty = true){
	delay = time_source_create(time_source_game, 10, time_source_units_frames, function(){
		if (delayCheck != false){
			delayCheck = false;
		}
		time_source_stop(delay);
	});
	time_source_start(delay);
	
	obj_textbox.proceed = false;
	if (delayCheck != true){
		if (global.PR){
			if (difficulty_page < 2){
				difficulty_page++;
				audio_play_sound(snd_typewriter, 5, false);
			}
		}
		if (global.PL){
			if (difficulty_page > 0){
				difficulty_page--;
				audio_play_sound(snd_typewriter, 5, false);
			}
		}
		if (global.POK){
			obj_textbox.proceed = true;
			obj_textbox.page += 1;
			menu.ds_menu_difficulty = 0;
			global.difficultySet = difficulty_page;
			draw_difficulty = false;
			confirm_difficulty = true;
			instance_destroy(obj_textbox);
			create_textbox(text2, speakers2, next_line2, scripts2);
		}
	}
} else {
	difficulty_page = 0;
}