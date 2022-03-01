if (keyboard_check_pressed(global.key_esc)){
	if (!instance_exists(obj_textbox) and global.canPause == true){
		global.pause = true;
	}
}
if (global.pause == true){
	instance_deactivate_layer("Instances");
} else {
	instance_activate_layer("Instances");
}
if (instance_exists(obj_devmode)){
	global.hasBackpack = true;
	global.hasCoat = true;
}
