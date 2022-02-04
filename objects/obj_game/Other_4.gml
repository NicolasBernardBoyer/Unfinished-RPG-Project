if(spawnRoom == -1) exit;
if (instance_exists(obj_player)){
	obj_player.x = spawnX;
	obj_player.y = spawnY;
}