//collision rectangle for detecting the player
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

/* If there is an instance and that instance has not run already
when colliding, create the textbox and change dave's sprite */
if (inst!=noone){
	if (runOnce == false){
		if (!instance_exists(obj_textbox)) {
			create_textbox(text, speakers, next_line, scripts);
			obj_davecouch.image_index = 4;
			obj_textbox.portrait_index = portrait_index;
			runOnce = true;
		}
	}

// If no longer colliding, reset the runOnce condition so it can play again
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

