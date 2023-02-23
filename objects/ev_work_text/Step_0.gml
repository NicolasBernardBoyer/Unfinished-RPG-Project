//once the cutscene is over destroy the disposable kat
if (destroyKat = true){
	instance_destroy(obj_kat);
}

//once this condition is true set the spawn area to a certain point
//and change the room to the crater room with a transition
if (goToPark = true){
	obj_game.spawnX = 237;
	obj_game.spawnY = 30;
	obj_game.spawnRoom = rm_park_crater;
	obj_game.doTransition = true;
}