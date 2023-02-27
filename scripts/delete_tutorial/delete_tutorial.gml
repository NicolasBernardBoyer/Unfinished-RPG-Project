// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function delete_tutorial(){
	// end the tutorial
	global.inventoryTB = false;
	instance_destroy(obj_inventorytutorial);
	instance_destroy(obj_textbox);
}