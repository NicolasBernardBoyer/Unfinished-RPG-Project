var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);
if (inst!=noone){
	if (runOnce == false){
		// Run the cutscene
		if (!instance_exists(obj_textbox)) {
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
	}
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

if (playerApproach = true and obj_player.x != 223){
	obj_player.x = Approach(obj_player.x, 223, 3);
	if (obj_player.x < 223){
		obj_player.sprite_index = spr_player_rightwalk_coat;
	} else if (obj_player.x > 223){
		obj_player.sprite_index = spr_player_rightwalk_coat;
	}
} else if (obj_player.x = 223 and playerApproach = true){
	obj_player.sprite_index = spr_player_upwalk_coat;
	obj_player.image_index = 0;
	obj_player.vspeed = 0;
	obj_player.image_speed = 0;
	playerApproach = false;
	camera.
}


