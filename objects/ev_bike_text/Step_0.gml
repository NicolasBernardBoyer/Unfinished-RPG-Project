if (deactivatePlayer = true){
	if (instance_exists(obj_player)){
		instance_deactivate_object(obj_player);
		deactivatePlayer = false;
	}
}