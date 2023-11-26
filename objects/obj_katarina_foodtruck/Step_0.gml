
// If Katarina is standing UP and finishes animation, change to second sprite
if (sprite_index = spr_kat_sit_getUP){
	image_speed = 1;
	if (image_index = 7){
		sprite_index = spr_kat_sit_getUP2;
	}
}

// when second getUP is done, switch to normal standing sprite
if (sprite_index = spr_kat_sit_getUP2 and image_index = 4){
	if (move_getUP_y = true){
		image_speed = 0;
		y+= 5;
		audio_play_sound(snd_move, 5, false);
		move_getUP_y = false;
	}
	time_source_start(swapSprite);
}

// After getting UP, have kat walk towards the player
if (move_getUP_y2 = false){
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

// remove all textboxes and delete any textbox
if (end_scene){
	instance_destroy(obj_textbox);
	
	obj_game.spawn_room = rm_workshift;
	obj_game.do_transition = true;
}

