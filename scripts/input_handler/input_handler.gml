// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function input_handler(){
	#region PAUSING
// handle pausing
if (keyboard_check_pressed(global.key_esc) or gamepad_button_check_pressed(0,global.gp_esc)){
	if(room != rm_title_screen){
		if (!instance_exists(obj_textbox) and global.can_pause == true and !instance_exists(obj_name_creator)){
			global.pause = true;
		}
	}
}
if (global.pause == true){
	instance_deactivate_layer("Instances");
}
if (global.pause == false){
	instance_activate_layer("Instances");
}
if (global.do_transition){
	global.can_pause = false;
}
/*
if (global.pause == false and global.can_pause == true and !instance_exists(obj_textbox)){
	if (global.has_backpack){
		if (global.PINV and !global.inventoryOpen){
			global.inventoryOpen = true;
			audio_play_sound(global.s_select, 5, false);
		} 
	}
}
*/
#endregion
if (instance_exists(obj_player)){
	global.target_x = obj_player.x;
	global.target_y = obj_player.y;
}
#region ACTIVATE DEVMODE PRIVILEGES
if (instance_exists(obj_devmode)){
	global.has_backpack = true;
	global.has_coat = true;
}
#endregion
#region PLAYER INPUT
//HELD
var h_move = gamepad_axis_value(global.pad_num, gp_axislh);
var v_move = gamepad_axis_value(global.pad_num, gp_axislv);
if (keyboard_check(global.key_right) or gamepad_button_check(0,global.gp_right)
	or h_move > 0){
	global.hr = true;
}
else global.hr = false;
if (keyboard_check(global.key_left) or gamepad_button_check(0,global.gp_left)
	or h_move < 0){ 
	global.hl = true;
}
else global.hl = false;
if (keyboard_check(global.key_up) or gamepad_button_check(0,global.gp_up)
	or v_move < 0){
	global.hu = true;
}
else global.hu = false;
if (keyboard_check(global.key_down) or gamepad_button_check(0,global.gp_down)
	or v_move > 0){
	global.hd = true;
}
else global.hd = false;
if (keyboard_check(global.key_revert) or gamepad_button_check(0,global.gp_shoulder_r) or gamepad_button_check(0,global.gp_shoulder_l)) global.hrun = true;
else global.hrun = false;
//RELEASED
if (keyboard_check_released(global.key_right) or gamepad_button_check_released(0,global.gp_right)) global.rr = true;
else global.rr = false;
if (keyboard_check_released(global.key_left) or gamepad_button_check_released(0,global.gp_left)) global.rl = true;
else global.rl = false;
if (keyboard_check_released(global.key_up) or gamepad_button_check_released(0,global.gp_up)) global.ru = true;
else global.ru = false;
if (keyboard_check_released(global.key_down) or gamepad_button_check_released(0,global.gp_down)) global.rd = true;
else global.rd = false;
//PRESSED
if (keyboard_check_pressed(global.key_right) or gamepad_button_check_pressed(0,global.gp_right)){
	global.pr = true;
}
else global.pr = false;
if (keyboard_check_pressed(global.key_left) or gamepad_button_check_pressed(0,global.gp_left)){
	global.pl = true;
}
else global.pl = false;
if (keyboard_check_pressed(global.key_up) or gamepad_button_check_pressed(0,global.gp_up)){
	global.pu = true;
}
else global.pu = false;
if (keyboard_check_pressed(global.key_down) or gamepad_button_check_pressed(0,global.gp_down)){
	global.pd = true;
}
else global.pd = false;
if (keyboard_check_pressed(global.key_enter) or keyboard_check_pressed(global.key_confirm) or
	gamepad_button_check_pressed(0,global.gp_enter) or gamepad_button_check_pressed(0,global.gp_confirm))
global.pok = true;
else global.pok = false;
if (keyboard_check_pressed(global.key_revert) or keyboard_check_pressed(global.key_del) or
gamepad_button_check_pressed(0,global.gp_revert) or gamepad_button_check_pressed(0,global.gp_del))
global.pcan = true;
else global.pcan = false;
if (keyboard_check_pressed(global.key_shift) or gamepad_button_check_pressed(0,global.gp_shift))
global.psel = true;
else global.psel = false;
/*if (keyboard_check_pressed(global.key_inventory) or gamepad_button_check_pressed(0,global.gp_inventory))
global.PINV = true;
else global.PINV = false; */
#endregion
}