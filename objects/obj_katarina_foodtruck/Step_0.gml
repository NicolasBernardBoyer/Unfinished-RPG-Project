
// If Katarina is standing up and finishes animation, change to second sprite
if (sprite_index = spr_kat_sit_getup){
	image_speed = 1;
	if (image_index = 7){
		sprite_index = spr_kat_sit_getup2;
	}
}

// when second getup is done, switch to normal standing sprite
if (sprite_index = spr_kat_sit_getup2 and image_index = 4){
	if (move_getup_y = true){
		image_speed = 0;
		y+= 5;
		audio_play_sound(snd_move, 5, false);
		move_getup_y = false;
	}
	time_source_start(swap_sprite);
}

// After getting up, have kat walk towards the player
if (move_getup_y2 = false){
	time_source_start(approach_event);
	if (image_speed = 1){
		x = approach(x, 164, 1);
	}
	if (x = 164){
		image_index = 0;
		image_speed = 0;
		time_source_stop(approach_event);
	time_source_start(another_tb);
	}
}

// remove all textboxes and delete any textbox
if (end_scene){
	instance_destroy(obj_textbox);
	
	obj_game.spawn_room = rm_workshift;
	obj_game.do_transition = true;
}

