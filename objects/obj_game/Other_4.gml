// handle where player will go after a transition
if(spawn_room == -1) exit;
if (instance_exists(obj_player)){
	obj_player.x = spawn_x;
	obj_player.y = spawn_y;
	// additional party members appear on top of player
	if (obj_player.can_move = true){
		if (instance_exists(obj_kat)){
			obj_kat.x = spawn_x;
			obj_kat.y = spawn_y;
		}
	}
}

part_system_clear(global.partSystem);