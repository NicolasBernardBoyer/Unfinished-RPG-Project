if (keyboard_check_pressed(vk_anykey) and global.pause = false){
	instance_activate_object(obj_player);
	room_goto(rm_yourbedroom);
}
if (alarm[0] == -1){
	alarm[0] = 30;
}
