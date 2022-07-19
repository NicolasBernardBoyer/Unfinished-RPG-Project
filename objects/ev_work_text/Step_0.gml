if (deactivatePlayer = true){
	if (instance_exists(obj_player)){
		instance_deactivate_object(obj_player);
		deactivatePlayer = false;
	}
}

if (goToPark = true){
	instance_activate_object(obj_player);
	obj_game.spawnX = 223;
	obj_game.spawnY = 17;
	obj_game.spawnRoom = rm_park_crater;
	obj_game.doTransition = true;
}