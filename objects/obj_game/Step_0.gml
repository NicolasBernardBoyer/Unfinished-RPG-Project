if (keyboard_check_pressed(global.key_esc)){
	instance_deactivate_object(obj_textbox);
	global.pause = true;
}
if (!global.pause){
	instance_activate_object(obj_textbox);
}