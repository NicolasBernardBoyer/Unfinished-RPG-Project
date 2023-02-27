// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function canPauseTrue(){
	// allow the player to pause and move again
	global.highbox = false;
	global.canPause = true;
	obj_player.canMove = true;
	instance_destroy(obj_textbox);
	obj_player.active_textbox = noone;
}