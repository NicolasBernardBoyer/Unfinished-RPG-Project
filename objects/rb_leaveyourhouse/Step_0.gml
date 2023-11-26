// Collision rectangle for detecting the player
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){

	if (runOnce == false){
	if (global.has_coat == true){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			name = "";
			voice = snd_typewriter;
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
		// Destroys itself if the player doesn't have their coat.
		} else {
			instance_destroy();
		}
	}

// If you aren't meeting the player, reset the runOnce condition
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

if (movePlayer = true){
	if (alarm[0] = -1){
		alarm[0] = 10;
	}
	with (obj_player){
		can_move = false;
		global.can_pause = false;
		sprite_index = spr_player_upwalk_coat;
		image_speed = 1;
		y--;
	}
}
