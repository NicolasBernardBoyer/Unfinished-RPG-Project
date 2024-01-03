// start cutscene and stop player from moving
global.can_pause = false;
obj_player.can_move = false;
obj_player.sprite_index = spr_player_rightwalk_coat;
obj_player.image_index = 0;
obj_player.image_speed = 0;

// player door sfx and stop the birds chirping
audio_play_sound(global.s_door, 5, false);
audio_stop_sound(global.s_birds);

// Have kat look at the player surprised after a delay
sprite_change = time_source_create(time_source_game, 3, time_source_units_seconds, function()
{
	sprite_index = spr_kat_sit_surprised;
	time_source_stop(sprite_change);
}
, [], -1);
time_source_start(sprite_change);

// play the whip sound effect and stop image speed
sprite_freeze = time_source_create(time_source_game, 4, time_source_units_seconds, function()
{
	audio_play_sound(global.s_whip, 5, false);
	image_speed = 0;
	time_source_stop(sprite_freeze);
}
, [], -1);
time_source_start(sprite_freeze);

// start first textbox
make_text = time_source_create(time_source_game, 5, time_source_units_seconds, function()
{
	global.name_text_col = c_gray;
	global.hasportrait = true;
	create_textbox(text, speakers, next_line, scripts);
	
	time_source_stop(make_text);
}
, [], -1);
time_source_start(make_text);
