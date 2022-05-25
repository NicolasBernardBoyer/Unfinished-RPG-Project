// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_fall_over(){
	obj_player.canMove = false;
	global.canPause = false;
	audio_play_sound(global.s_punch, 5, false);
	obj_player.x += 8;
	obj_player.y += 8;
	obj_player.sprite_index = spr_player_on_ground;
	obj_bikerack.fallEvent = true;
}