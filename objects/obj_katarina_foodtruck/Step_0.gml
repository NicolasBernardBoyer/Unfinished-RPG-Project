if (instance_exists(obj_facetextbox)){
	if (obj_facetextbox.portrait = noone){
		obj_facetextbox.portrait = spr_kat_faces;
	}
	obj_facetextbox.portrait_index = portrait_index;
	obj_facetextbox.portrait = portrait;
	obj_facetextbox.name = name;
}

if (run2ndTextbox = true){
	instance_destroy(obj_textbox);
	portrait_index = 4;
	create_facetextbox(text2, speakers2, next_line2, scripts2);
	run2ndTextbox = false;
}

if (run4thTextbox = true){
	instance_destroy(obj_textbox);
	create_textbox(text4, speakers4, next_line4, scripts4);
	run4thTextbox = false;
}

if (sprite_index = spr_kat_sit_getup){
	image_speed = 1;
	if (image_index = 7){
		sprite_index = spr_kat_sit_getup2;
	}
}

if (sprite_index = spr_kat_sit_getup2 and image_index = 4){
	if (move_getup_y = true){
		image_speed = 0;
		y+= 5;
		audio_play_sound(snd_move, 5, false);
		move_getup_y = false;
	}
	time_source_start(swapSprite);
}

if (move_getup_y2 = false){
	time_source_start(approach);
	if (image_speed = 1){
		x = Approach(x, 164, 1);
	}
	if (x = 164){
		image_index = 0;
		image_speed = 0;
		time_source_stop(approach);
	time_source_start(anotherTB);
	}
}

if (end_scene){
	instance_destroy(obj_textbox);
	
	obj_game.spawnRoom = rm_workshift;
	obj_game.doTransition = true;
}

