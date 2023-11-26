// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_approach_true(){
	// have player move towards to center of the park in manager cutscene
	global.can_pause = false;
	obj_player.can_move = false;
	rb_managercutscene.playerApproach = true;
}