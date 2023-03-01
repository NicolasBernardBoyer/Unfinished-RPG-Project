// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_approach_true(){
	// have player move towards to center of the park in manager cutscene
	global.canPause = false;
	obj_player.canMove = false;
	rb_managercutscene.playerApproach = true;
}