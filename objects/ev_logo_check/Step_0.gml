if (obj_player.x > 191){
	obj_player.canMove = false;
	global.canPause = false;
	
	if (obj_player.x < 223 or obj_kat.x < 256 and katApproach = false){
		obj_player.x = Approach(obj_player.x, 223, 2);
		obj_kat.x = Approach(obj_kat.x, 256, 2);
		if (obj_player.x < 223){
			obj_player.sprite_index = spr_player_rightwalk_coat; }
		else {
			obj_player.sprite_index = spr_player_upwalk_coat;
			obj_player.image_index = 0;
		}
		obj_kat.sprite_index = spr_kat_rightwalk;
	} else if (!instance_exists(obj_textbox) and katApproach = false){
		with (obj_player){
			sprite_index = spr_player_upwalk_coat;
			image_index = 0;
			image_speed = 0;}
		with (obj_kat){
			sprite_index = spr_kat_upwalk;
			image_index = 0;
			image_speed = 0;}
		obj_kat.portrait_index = 11;
		create_textbox(text, speakers, next_line, scripts);
	} else if (katApproach = true){
		obj_kat.x = Approach(obj_kat.x, obj_player.x+25, 2);
		if (obj_kat.x > obj_player.x+25){
			with (obj_kat){
				image_speed = 1;
				sprite_index = spr_kat_leftwalk;
			}
		} else {
			destroy_obj(self);
		}
	}
}






