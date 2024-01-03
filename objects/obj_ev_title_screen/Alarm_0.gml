if (title_menu = false){
	if (instance_exists(obj_ev_title_screen_text)){
		instance_destroy(obj_ev_title_screen_text);	
	}
	global.textvisible = !global.textvisible;
	instance_create_layer(0,0, "Instances", obj_ev_title_screen_text);
}
