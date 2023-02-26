// https://youtu.be/dQw4w9WgXcQ
// If you move, turn all booleans off, create a player object
if (moveReady){
	if (global.HU or global.HD or global.HR or global.HL){
		runAlarm = false;
		moveReady = false;
		sprite_index = spr_yellowbed;
		instance_create_layer(240, 143, "Instances", obj_player);
	}
}

// if the text alarm is active, make the sprite move and turn the boolean off
if (textAlarm){
	image_speed = 1;
	if (alarm[1] = -1){
		alarm[1] = 60;
	}
	textAlarm = false;
}