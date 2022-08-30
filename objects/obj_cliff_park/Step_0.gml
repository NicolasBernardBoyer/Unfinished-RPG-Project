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
	if (dropSpeed != 1){
		dropSpeed += 1/120;
	}
	
	position = animcurve_channel_evaluate(curve,dropSpeed);
	
	var _startplayer = obj_player.y;
	var _endplayer = 300;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = obj_katarina_crater_room.y;
	var _endkat = 300;
	var _distancekat = _endkat - _startkat;
	
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_katarina_crater_room.y = _startkat + (_distancekat * position);
	
}

