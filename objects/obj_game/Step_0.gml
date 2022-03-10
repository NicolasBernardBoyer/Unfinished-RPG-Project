if (keyboard_check_pressed(global.key_esc) or gamepad_button_check_pressed(0,global.gp_esc)){
	if(room != rm_title_screen){
		if (!instance_exists(obj_textbox) and global.canPause == true and !instance_exists(obj_name_creator)){
			global.pause = true;
		}
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
