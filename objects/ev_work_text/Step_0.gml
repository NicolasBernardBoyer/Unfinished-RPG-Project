//once the cutscene is over destroy the disposable kat
if (destroyKat = true){
	instance_destroy(obj_kat);
}

//once this condition is true set the spawn area to a certain point
//and change the room to the crater room with a transition
if (goToPark = true){
	obj_game.spawn_x = 237;
	obj_game.spawn_y = 30;
	obj_game.spawn_room = rm_park_crater;
	obj_game.do_transition = true;
}