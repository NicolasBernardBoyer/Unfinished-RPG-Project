
// move_cam = keyboard_check(ord("C"));
if (!instance_exists(obj_player) or room = rm_yourbedroom) exit;

// have the obj_camera follow whatever it is following
if (following != noone){
	x_to = following.x;
	y_to = following.y;
	
	x += x_to - x;
	y += y_to - y;
}


if (room_width >= cam_width){
	x= clamp(x,0+halfcamerawidth,room_width-halfcamerawidth);
} else {
	x = room_width/2;
}
if (room_height >= cam_height){
	y= clamp(y,0+halfcameraheight,room_height-halfcameraheight);
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




