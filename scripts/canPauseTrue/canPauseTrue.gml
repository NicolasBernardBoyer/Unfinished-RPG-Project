// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function can_pause_true(){
	// allow the player to pause and move again
	global.highbox = false;
	global.can_pause = true;
	obj_player.can_move = true;
	instance_destroy(obj_textbox);
	obj_player.active_textbox = noone;
}