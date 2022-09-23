
if (!instance_exists(obj_textbox)){
	create_textbox(text, speakers, next_line, scripts);
}

if (draw_difficulty = true){
	obj_textbox.proceed = false;
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
		menu.ds_menu_difficulty = 0;
		draw_difficulty = false;
	}
} else {
	difficulty_page = 0;
}