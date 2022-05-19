// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_approach_true(){
	global.canPause = false;
	obj_player.canMove = false;
	instance_destroy(obj_textbox);
	rb_managercutscene.playerApproach = true;
}