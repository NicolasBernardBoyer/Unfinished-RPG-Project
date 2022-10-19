// https://youtu.be/dQw4w9WgXcQ
if (moveReady){
	if (keyboard_check(global.key_up) or keyboard_check(global.key_down) or keyboard_check(global.key_right) or keyboard_check(global.key_left)){
		runAlarm = false;
		moveReady = false;
		sprite_index = spr_yellowbed;
		instance_create_layer(240, 143, "Instances", obj_player);
	}
}

if (textAlarm){
	image_speed = 1;
	if (alarm[1] = -1){
		alarm[1] = 60;
	}
	textAlarm = false;
}