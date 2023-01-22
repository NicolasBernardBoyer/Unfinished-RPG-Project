

switch (cutProg){
	case -1:
	if (obj_player.x > 188){
		cutProg++;
	}
	break;
	case 0:
	obj_player.image_index = 0;
	obj_kat.image_index = 0;
	instance_create_layer(obj_player.x, obj_player.y, "Collision", obj_wall);
	global.canPause = false;
	obj_player.canMove = false;
	if (!instance_exists(obj_textbox)){
		obj_kat.portrait_index = 14;
		create_textbox(text, speakers, next_line, scripts);
	}
	break;
	
	case 1:
	obj_player.image_index = 0;
	obj_kat.image_index = 0;
	with (camera){
		following = noone;
		x = Approach(x, ev_bat_saveguy.x, 2);
	}
	if (camera.x >= ev_bat_saveguy.x){
		if (!instance_exists(obj_textbox)){
			obj_kat.portrait_index = 19;
			create_textbox(text2, speakers2, next_line2, scripts2);
		}
	}
	break;
	
	case 2:
	obj_kat.image_index = 0;
	with (obj_player){
		x = Approach(x, ev_bat_saveguy.x, 2);
		y = Approach(y, ev_bat_saveguy.y, 2);
	if (x >= ev_bat_saveguy.x and y+1 >= ev_bat_saveguy.y and 
		y-1 <= ev_bat_saveguy.y) {
			sprite_index = spr_player_walk_coat;
			image_speed = 0;
		} else {
			sprite_index = spr_player_rightwalk_coat;
			image_speed = 1;
		}
	}
	break;
	
	case 3:
	obj_player.image_index = 0;
	obj_kat.image_index = 0;

}





