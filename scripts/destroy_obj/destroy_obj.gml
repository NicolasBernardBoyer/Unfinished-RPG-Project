// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destroy_obj(){
	///@arg object
	// destroy the current object and let player move again
	// useful for ending cutscenes
	global.canPause = true;
	
	with (obj_player){
		canMove = true;
		state = stateFree;
	}
	
	instance_destroy(argument0);
	
}