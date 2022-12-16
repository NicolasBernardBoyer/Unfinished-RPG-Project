
// moveCam = keyboard_check(ord("C"));
if (!instance_exists(obj_player)) exit;


if (following != noone){
	xTo = following.x;
	yTo = following.y;
}

x += xTo - x
y += yTo - y

camera_set_view_pos(
	view_camera[0],
	floor(x-(camWidth*0.5)),
	floor(y-(camHeight*0.5))
	);


