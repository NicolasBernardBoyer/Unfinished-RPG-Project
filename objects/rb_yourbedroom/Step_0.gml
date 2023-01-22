var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){

	if (runOnce == false){
	if (global.hasBackpack == false){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
		} else {
			instance_destroy();
		}
	}
	
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

if (movePlayer = true){
	if (alarm[0] = -1){
		alarm[0] = 10;
	}
	with (obj_player){
		canMove = false;
		global.canPause = false;
		sprite_index = spr_player_upwalk;
		image_speed = 1;
		y--;
	}
}

