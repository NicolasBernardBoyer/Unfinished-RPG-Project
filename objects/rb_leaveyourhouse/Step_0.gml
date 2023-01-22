// Collision rectangle for detecting the player
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){

	if (runOnce == false){
	if (global.hasCoat == true){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			name = "";
			voice = snd_typewriter;
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
		// Destroys itself if the player doesn't have their coat.
		} else {
			instance_destroy(self);
		}
	}

// If you aren't meeting the player, reset the runOnce condition
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}
