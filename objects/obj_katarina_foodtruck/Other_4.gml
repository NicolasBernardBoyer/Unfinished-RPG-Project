global.canPause = false;
obj_player.canMove = false;
obj_player.sprite_index = spr_player_rightwalk_coat;
obj_player.image_index = 0;
obj_player.image_speed = 0;

audio_play_sound(global.s_door, 5, false);
audio_stop_sound(global.s_birds);

spriteChange = time_source_create(time_source_game, 3, time_source_units_seconds, function()
{
	sprite_index = spr_kat_sit_surprised;
	time_source_stop(spriteChange);
}
, [], -1);
time_source_start(spriteChange);

spriteFreeze = time_source_create(time_source_game, 4, time_source_units_seconds, function()
{
	audio_play_sound(global.s_whip, 5, false);
	image_speed = 0;
	time_source_stop(spriteFreeze);
}
, [], -1);
time_source_start(spriteFreeze);

makeText = time_source_create(time_source_game, 5, time_source_units_seconds, function()
{
	global.name_text_col = c_gray;
	global.hasportrait = true;
	create_facetextbox(text, speakers, next_line, scripts);
	
	time_source_stop(makeText);
}
, [], -1);
time_source_start(makeText);
