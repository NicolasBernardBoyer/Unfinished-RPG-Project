// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function backpack_pickup(){
	global.hasBackpack = true;

	instance_destroy(inst_17AEB05D);
	instance_destroy(obj_backpack);
	
}