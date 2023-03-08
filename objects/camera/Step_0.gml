
// moveCam = keyboard_check(ord("C"));
if (!instance_exists(obj_player) or room = rm_yourbedroom) exit;

// have the camera follow whatever it is following
if (following != noone){
	xTo = following.x;
	yTo = following.y;
	
	x += xTo - x;
	y += yTo - y;
}

// have the camera stay so that the player is at the center
if (room_width >= camWidth){
	x= clamp(x,0+halfcamerawidth,room_width-halfcamerawidth);
} else {
	x = room_width/2;
}
if (room_height >= camHeight){
	y= clamp(y,0+halfcameraheight,room_height-halfcameraheight);
} else {
	y = room_height/2;
}

//prevent the camera from jittering on the edges of a room
if (room_width >= camWidth or room_height >= camHeight){
	camera_set_view_pos(
		view_camera[0],
		floor(x-(camWidth*0.5)),
		floor(y-(camHeight*0.5))
	);
}



