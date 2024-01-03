// By pressing any key play sfx and display the obj_menu,
// Reset playsound to prevent double sfx
if ((keyboard_check_pressed(vk_anykey) or gamepad_button_check_pressed(0, gp_start)) or mouse_check_button_pressed(mb_any) and global.pause = false and playsound = true){
	if (playsound == true) audio_play_sound(snd_select, 5, false);
	instance_activate_object(obj_title_menu);
	instance_destroy(obj_ev_title_screen_text);
	title_menu = true;
	playsound = false;
}
if (alarm[0] == -1 and title_menu = false){
	alarm[0] = 30;
}
