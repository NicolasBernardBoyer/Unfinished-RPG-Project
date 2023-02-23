
	if (instance_exists(obj_player)){
		// Deactivate player and their sprite
		obj_player.sprite_index = noone;
		instance_deactivate_object(obj_player);
	}