// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function let_manager_pass(){
	obj_manager.managerPass = true;
	obj_manager.runOnce = true;
	global.canPause = false;
	obj_player.canMove = false;
	instance_destroy(obj_textbox);
}