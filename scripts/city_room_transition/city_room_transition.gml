// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function city_room_transition(){
	instance_destroy(obj_textbox);
	with(obj_game){
		if(!doTransition){
			spawnRoom = rm_waytowork;
			spawnX = 587;
			spawnY = 187;
			doTransition = true;
		}
	}
	instance_activate_object(obj_player);
}