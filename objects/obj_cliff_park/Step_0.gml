if (!cliffBreak){
	image_speed = 0;
} else if (image_index = 10){
	image_speed = 0;
} else {
	image_speed = 1;
	cliffBreak = true;
}

if (cliffBreak and !dropOff){
	if (alarm[0] = -1){
		alarm[0] = 10;
	}
}

if (dropOff) {
	dropSpeed = Approach(dropSpeed, 4, 0.2);
	obj_player.y += dropSpeed;
	obj_katarina_crater_room.y += dropSpeed;
}

