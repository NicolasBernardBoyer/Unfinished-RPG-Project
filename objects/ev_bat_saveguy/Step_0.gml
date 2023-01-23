
// Run depending on cutscene progression
switch (cutProg){
	case -1:
	//trigger cutscene when player reaches a certain point
	if (obj_player.x > 188){
		cutProg++;
	}
	break;
	case 0:
		obj_player.sprite_index = spr_player_rightwalk_coat;
		obj_kat.sprite_index = spr_kat_rightwalk;
		obj_player.image_speed = 0;
		obj_player.image_speed = 0;
		obj_kat.image_speed = 0;
		obj_player.image_index = 0;
		obj_kat.image_index = 0;

	//creates a textbox
	global.canPause = false;
	obj_player.canMove = false;
	if (!instance_exists(obj_textbox)){
		obj_kat.portrait_index = 14;
		create_textbox(text, speakers, next_line, scripts);
	}
	break;

	case 1:
	// moves the camera towards the ref point
	with (camera){
		following = noone;
		x = Approach(x, ev_bat_saveguy.x, 2);
	}
	//once the camera is close enough, create the textbox
	if (camera.x >= ev_bat_saveguy.x){
		if (!instance_exists(obj_textbox)){
			obj_kat.portrait_index = 19;
			create_textbox(text2, speakers2, next_line2, scripts2);
		}
	}
	break;
	
	case 2:
	//have the player move towards the area where save guy passes him the bat
	with (obj_player){
		x = Approach(x, ev_bat_saveguy.x, 2);
		y = Approach(y, ev_bat_saveguy.y, 2);
	//changes player sprite to make them walk and then stop once ref point is reached
		if (x >= ev_bat_saveguy.x and y+1 >= ev_bat_saveguy.y and 
			y-1 <= ev_bat_saveguy.y) {
				sprite_index = spr_player_walk_coat;
				image_speed = 0;
			} else {
				sprite_index = spr_player_rightwalk_coat;
				image_speed = 1;
			}
	}
	if (obj_player.sprite_index = spr_player_walk_coat){
		obj_save_guy.image_index = 0;
		cutProg++;
	}
	break;
	
	case 3:
	obj_save_guy.sprite_index = spr_save_guy_armout;
	cutProg++;
	break;
	
	case 4:
	if (obj_save_guy.image_index > image_number -1){
		obj_save_guy.image_speed = 0;
	}
	break;
}




