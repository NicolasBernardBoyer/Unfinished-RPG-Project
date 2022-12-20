
// moveCam = keyboard_check(ord("C"));
if (!instance_exists(obj_player) or room = rm_yourbedroom) exit;

if (following != noone){
	xTo = following.x;
	yTo = following.y;
	
	x += xTo - x
	y += yTo - y
}

x= clamp(x,0+halfcamerawidth,room_width-halfcamerawidth);
y= clamp(y,0+halfcameraheight,room_height-halfcameraheight);

if (room_width >= camWidth or room_height >= camHeight){
	camera_set_view_pos(
		view_camera[0],
		floor(x-(camWidth*0.5)),
		floor(y-(camHeight*0.5))
	);
}


