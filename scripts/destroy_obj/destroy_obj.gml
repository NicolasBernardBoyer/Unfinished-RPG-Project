// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_obj(){
	///@arg object
	obj_player.canMove = true;
	global.canPause = true;
	instance_destroy(argument0);
}