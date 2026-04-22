
// move_cam = keyboard_check(ord("C"));
if (!instance_exists(obj_player) or room = rm_yourbedroom) exit;

// have the obj_camera follow whatever it is following
if (following != noone){
	x = following.x;
	y = following.y;
}


if (room_width >= cam_width){
	x= clamp(x,halfcamerawidth,room_width-halfcamerawidth);
} else {
	x = room_width/2;
}
if (room_height >= cam_height){
	y= clamp(y,halfcameraheight,room_height-halfcameraheight);
} else {
	y = room_height/2;
}

if (room_width >= cam_width or room_height >= cam_height){
	camera_set_view_pos(
		view_camera[0],
		floor(x-(cam_width*0.5)),
		floor(y-(cam_height*0.5))
	);
}




