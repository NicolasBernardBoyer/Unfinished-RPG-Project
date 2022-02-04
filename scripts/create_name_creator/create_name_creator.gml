// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_name_creator(){
	instance_destroy(obj_textbox);
	instance_create_layer(0,0, "Instances", ev_name_creator_timer);
}