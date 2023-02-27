// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg value

function port_swap() {
	// switch the portrait of a textbox (shorter than doing change_variable)
	variable_instance_set(obj_textbox,"portrait_index",argument0);
}