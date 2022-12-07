// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg value

function port_swap() {
	if (instance_exists(obj_facetextbox)){
		variable_instance_set(obj_facetextbox,"portrait_index",argument0);
	} else {
		variable_instance_set(obj_textbox,"portrait_index",argument0);
	}
}