// By pressing any key play sfx and display the menu,
// Reset playsound to prevent double sfx
if ((keyboard_check_pressed(vk_anykey) or gamepad_button_check_pressed(0, gp_start)) or mouse_check_button_pressed(mb_any) and global.pause = false and playsound = true){
	if (playsound == true) audio_play_sound(snd_select, 5, false);
	instance_activate_object(obj_titlemenu);
	instance_destroy(ev_title_screen_text);
	titleMenu = true;
	playsound = false;
}
if (alarm[0] == -1 and titleMenu = false){
	alarm[0] = 30;
}
