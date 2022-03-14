
if ((keyboard_check_pressed(vk_anykey) or gamepad_button_check_pressed(0, gp_start)) and global.pause = false and playsound = true){
	if (playsound == true) audio_play_sound(snd_select, 5, false);
	alarm[1] = 30;
	playsound = false;
}
if (alarm[0] == -1){
	alarm[0] = 30;
}
