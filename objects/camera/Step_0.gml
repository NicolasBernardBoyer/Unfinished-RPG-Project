/*x += (xTo - x)/25;
y += (yTo - y)/25;
if (instance_exists(obj_player) and followPlayer = true){
	follow = obj_player;
}
if (follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(cam,vm);
*/

// moveCam = keyboard_check(ord("C"));
if (!instance_exists(obj_player)) exit;

moveCam = false;

if (following != noone){
	if (moveCam) {
		x += (keyboard_check(vk_right) - keyboard_check(vk_left))*6;
		y += (keyboard_check(vk_down) - keyboard_check(vk_up))*6;
	} else {
		x = clamp(x, following.x-h_border, following.x+h_border);
		y = clamp(y, following.y-v_border, following.y+v_border);
	}
}

