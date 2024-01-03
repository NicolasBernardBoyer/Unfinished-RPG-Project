// on creation walking is true, so perform this
if (is_walking = true){
	// if obj_camera is moving, simply move y
	if (move_cam = true){
		y += 2;
	// if obj_camera isnt moving and player x is in right place set image speed to 1
	} else if (move_cam = false and obj_player.x = 256){
		image_speed = 1;
		y += 2;
	}
	// move obj_camera if walking towards ref point
	if (obj_camera.y != 264 and move_cam = true){
		obj_camera.y = approach(obj_camera.y, 264, 1);
	}
	// if has walked enough distance, remove from scene
	if (y >= 475){
		instance_destroy(self);
	}
}

// move player out of the way after dialogue
if (manager_pass = true){
	move_cam = false;
	if (obj_player.x != 256){
		obj_player.sprite_index = spr_player_leftwalk_coat;
		obj_player.image_speed = 1;
		obj_player.x = approach(obj_player.x, 256, 2);
	} else {
		// after moving out of the way freeze player and resume moving
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		is_walking = true;
	}
}

// if manager isnt walking stop animation
if (is_walking = false){
	image_index = 0;
	image_speed = 0;
}

// if no inventory and manager collides with player start dialogue
if (!global.inventory_open and is_walking = true){
	if(obj_player.active_textbox == noone){
		if (run_once = false){
			var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_player, false, true);
			if(inst != noone){
				is_walking = false;
				global.name_text_col = c_ltgray;
				var tbox = create_textbox(text, speakers, next_line, scripts);
				obj_player.active_textbox = tbox;
			}
		}
	} 
}
