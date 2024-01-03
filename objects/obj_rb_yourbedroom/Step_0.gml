var inst = collision_rectangle(x-radius_x, y-radius_y, x+radius_x, y+radius_y, obj_player, false, true);

if (inst!=noone){

	if (run_once == false){
	if (global.has_backpack == false){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			create_textbox(text, speakers, next_line, scripts);
			run_once = true;
		}
		} else {
			instance_destroy();
		}
	}
	
} else if (!place_meeting(x,y,obj_player)){
	run_once = false;
}

if (moveplayer = true){
	if (alarm[0] = -1){
		alarm[0] = 10;
	}
	with (obj_player){
		can_move = false;
		global.can_pause = false;
		sprite_index = spr_player_upwalk;
		image_speed = 1;
		y--;
	}
}

