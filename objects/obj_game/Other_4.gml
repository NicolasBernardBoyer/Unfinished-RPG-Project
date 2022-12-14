if(spawnRoom == -1) exit;
if (instance_exists(obj_player)){
	obj_player.x = spawnX;
	obj_player.y = spawnY;
	if (instance_exists(obj_kat)){
		if (obj_player.canMove = true and global.canPause = true){
			obj_kat.x = spawnX;
			obj_kat.y = spawnY;
		}
	}
}

part_system_clear(global.partSystem);