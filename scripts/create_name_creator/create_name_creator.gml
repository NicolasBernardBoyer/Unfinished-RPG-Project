// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_name_creator(){
	// stop textbox from continuing and make a name creator
	obj_textbox.proceed = false;
	instance_create_layer(0,0, "Instances", ev_name_creator_timer);
}