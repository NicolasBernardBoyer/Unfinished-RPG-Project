canMove = true;
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

stepLoop = time_source_create(time_source_game, 20, time_source_units_frames, function(){
	if (image_speed != 0) {
		audio_play_sound(snd_step, 5, false);
	} 
}, [], 1);

stepLoopFaster = time_source_create(time_source_game, 15, time_source_units_frames, function(){
	if (image_speed != 0) {
		audio_play_sound(snd_step, 5, false);
	} 
}, [], 1);