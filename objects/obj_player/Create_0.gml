canMove = true;
spd = 2;
sprite_index = spr_player_walk;
image_index = 0;
framebefore = 0;
lastframe = 0;
visible = false;

count = 0;

portrait_index = 0; 
portrait = noone;
voice = snd_typewriter;
name = "";

radius = 8;
active_textbox = noone;

facing = 0;

stepLoop = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (!keyboard_check(vk_up or vk_down or vk_right or vk_left)){
		image_index = 0;
	}
}, [], 1);

checkSpeed = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (spd = 2){
		image_speed = 1;
	} else {
		image_speed = 1.5;
	}
}, [], 1);