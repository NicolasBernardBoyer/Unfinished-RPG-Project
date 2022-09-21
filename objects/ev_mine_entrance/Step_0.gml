if (instance_exists(obj_facetextbox)){
obj_textbox.portrait_index = portrait_index;
obj_textbox.portrait = portrait;
}

switch (cutProg){
	case 0:
	if (obj_player.y != 127){
		obj_player.y++;
		obj_kat.y++;
		obj_bubble.y++;
	} else {
		cutProg++;
	}
	break;
	case 1:
	
	break;
}

if (cutProg > 0){
	dropSpeed += 1/60;
	if (dropSpeed > 1) dropSpeed -= 1;
	
	position = animcurve_channel_evaluate(curve,dropSpeed);
	
	var _startplayer = 98;
	var _endplayer = 128;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = 98;
	var _endkat = 128;
	var _distancekat = _endkat - _startkat;
	
	var _startbubble = 140;
	var _endbubble = 150;
	var _distancebubble = _endbubble - _startbubble;
	
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_kat.y = _startkat + (_distancekat * position);
	
	if (instance_exists(obj_bubble) and obj_bubble.image_index = 4){
		obj_bubble.y = _startbubble + (_distancebubble * position);
	}
}
