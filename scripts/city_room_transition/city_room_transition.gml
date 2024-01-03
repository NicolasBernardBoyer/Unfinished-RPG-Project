// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function city_room_transition(){
	instance_destroy(obj_textbox);
	// move player to the city scene
	with(obj_game){
		if(!do_transition){
			spawn_room = rm_way_towork;
			spawn_x = 1400;
			spawn_y = 238;
			instance_activate_object(obj_player);
			room_goto(spawn_room);
		}
	}
}