hsp = 0;
vsp = 0;

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
checkFrame = true;

radius = 8;
active_textbox = noone;

facing = 0;

stepLoop = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (!keyboard_check(vk_up) and !keyboard_check(vk_down) and !keyboard_check(vk_left) and !keyboard_check(vk_right)){
		image_index = 0;
	}
}, [], 1);

checkSpeed = time_source_create(time_source_game, 5, time_source_units_frames, function(){
if (keyboard_check(vk_up or vk_down or vk_right or vk_left)){
	if (spd = 2){
		image_speed = 1;
	} else {
		image_speed = 1.2;
	}
}
}, [], 1);