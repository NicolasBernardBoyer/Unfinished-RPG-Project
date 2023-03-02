// handle where player will go after a transition
if(spawnRoom == -1) exit;
if (instance_exists(obj_player)){
	obj_player.x = spawnX;
	obj_player.y = spawnY;
	// additional party members appear on top of player
	if (instance_exists(obj_kat)){
		obj_kat.x = spawnX;
		obj_kat.y = spawnY;
	}
}

part_system_clear(global.partSystem);