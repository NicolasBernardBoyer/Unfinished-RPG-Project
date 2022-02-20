// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goto_room(){
	global.pause = false;
	global.playintro = false;
	room_goto(rm_yourbedroom);
	instance_activate_object(obj_player);
}