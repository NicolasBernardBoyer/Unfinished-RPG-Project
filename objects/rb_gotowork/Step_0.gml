// Collision to detect player
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){

	if (runOnce == false){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			// Only run collision once when player touches
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
	}
	
// Collision resets and can run again if the player isn't touching it
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

