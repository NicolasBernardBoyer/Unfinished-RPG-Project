
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

