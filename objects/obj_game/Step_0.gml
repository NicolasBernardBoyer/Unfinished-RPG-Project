if (keyboard_check_pressed(global.key_esc)){
	if (!instance_exists(obj_textbox)){
		global.pause = true;
	}
}
