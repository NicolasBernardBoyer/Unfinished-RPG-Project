// Collision to detect player
var inst = collision_rectangle(x-radius_x, y-radius_y, x+radius_x, y+radius_y, obj_player, false, true);

if (inst!=noone){

	if (run_once == false){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			// Only run collision once when player touches
			create_textbox(text, speakers, next_line, scripts);
			run_once = true;
		}
	}
	
// Collision resets and can run again if the player isn't touching it
} else if (!place_meeting(x,y,obj_player)){
	run_once = false;
}

