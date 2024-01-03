//collision rectangle for detecting the player
var inst = collision_rectangle(x-radius_x, y-radius_y, x+radius_x, y+radius_y, obj_player, false, true);

/* If there is an instance and that instance has not run already
when colliding, create the textbox and change dave's sprite */
if (inst!=noone){
	if (run_once == false){
		if (!instance_exists(obj_textbox)) {
			create_textbox(text, speakers, next_line, scripts);
			obj_davecouch.image_index = 4;
			obj_textbox.portrait_index = portrait_index;
			run_once = true;
		}
	}

// If no longer colliding, reset the run_once condition so it can play again
} else if (!place_meeting(x,y,obj_player)){
	run_once = false;
}

