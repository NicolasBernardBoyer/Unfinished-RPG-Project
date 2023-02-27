// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function goto_title(){
	// return to title screen and save last room
	global.pause = false;
	global.previousRoom = room;
	room_goto(rm_title_screen);
}