
// Run depending on cutscene progression
switch (cut_prog){
	case -1:
	//trigger cutscene when player reaches a certain point
	if (obj_player.x > 188){
		new_encounter([global.enemies.save_guy], spr_bg_bluesky);
		cut_prog++;
	}
	break;
	case 0:
	//Freeze sprites for the party (turn this into a script)
	//	obj_player.sprite_index = spr_player_rightwalk_coat;
	//	obj_kat.sprite_index = spr_lat_right_walk;
	//	obj_player.image_speed = 0;
	//	obj_player.image_speed = 0;
	//	obj_kat.image_speed = 0;
	//	obj_player.image_index = 0;
	//	obj_kat.image_index = 0;

	////creates a textbox
	//global.can_pause = false;
	//obj_player.can_move = false;
	//if (!instance_exists(obj_textbox)){
	//	obj_kat.portrait_index = 14;
	//	create_textbox(text, speakers, next_line, scripts);
	//}
	break;

	case 1:
	// moves the obj_camera towards the ref point
	with (obj_camera){
		following = noone;
		x = approach(x, obj_ev_bat_saveguy.x, 2);
	}
	//once the obj_camera is close enough, create the textbox
	if (obj_camera.x >= obj_ev_bat_saveguy.x){
		if (!instance_exists(obj_textbox)){
			obj_kat.portrait_index = 14;
			create_textbox(text2, speakers2, next_line2, scripts2);
		}
	}
	break;
	
	case 2:
	//have the player move towards the area where save guy passes him the bat
	with (obj_player){
		x = approach(x, obj_ev_bat_saveguy.x, 2);
		y = approach(y, obj_ev_bat_saveguy.y, 2);
	//changes player sprite to make them walk and then stop once ref point is reached
		if (x >= obj_ev_bat_saveguy.x and y+1 >= obj_ev_bat_saveguy.y and 
			y-1 <= obj_ev_bat_saveguy.y) {
				sprite_index = spr_player_walk_coat;
				image_speed = 0;
			} else {
				sprite_index = spr_player_rightwalk_coat;
				image_speed = 1;
			}
	}
	/*if the player has stopped moving and their sprite has changed,
	continue the cutscene*/
	if (obj_player.sprite_index = spr_player_walk_coat){
		cut_prog++;
	}
	break;
	
	//Change save guy's sprite
	case 3:
	with (obj_save_guy){
		state = state_throw;
		if (!instance_exists(obj_bat)){
			instance_create_layer(x-32, y, "Instances", obj_bat);
		}
	}
	cut_prog++;
	break;
	
	//Once the animation is done, stop save_guy's speed
	case 4:
	if (obj_save_guy.image_speed = 0){
		
	}
	break;
}





