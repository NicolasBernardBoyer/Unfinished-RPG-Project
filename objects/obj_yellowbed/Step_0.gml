// https://youtu.be/dQw4w9WgXcQ
// If you move, turn all booleans off, create a player object
if (move_ready){
	if (global.hu or global.hd or global.hr or global.hl){
		run_alarm = false;
		move_ready = false;
		sprite_index = spr_yellowbed;
		instance_create_layer(240, 143, "Instances", obj_player);
	}
}

// if the text alarm is active, make the sprite move and turn the boolean off
if (text_alarm){
	image_speed = 1;
	if (alarm[1] = -1){
		alarm[1] = 60;
	}
	text_alarm = false;
}