global.canPause = false;
obj_player.canMove = false;
obj_player.sprite_index = spr_player_rightwalk_coat;
obj_player.image_index = 0;
obj_player.image_speed = 0;

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
	
