
if (keyboard_check_pressed(vk_anykey) and global.pause = false){
	audio_play_sound(snd_select, 5, false);
	alarm[1] = 30;
}
if (alarm[0] == -1){
	alarm[0] = 30;
}
