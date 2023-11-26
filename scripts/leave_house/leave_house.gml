// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function leave_house(){
	// activate the transition for leaving the house
	global.can_pause = false;
	instance_activate_object(inst_740548B5);
}