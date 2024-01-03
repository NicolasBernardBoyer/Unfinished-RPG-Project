// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function let_manager_pass(){
	// make manager keep moving in cutscene
	obj_manager.manager_pass = true;
	obj_manager.run_once = true;
	global.can_pause = false;
	obj_player.can_move = false;
	instance_destroy(obj_textbox);
}