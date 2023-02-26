// on creation walking is true, so perform this
if (isWalking = true){
	// if camera is moving, simply move y
	if (moveCam = true){
		y += 2;
	// if camera isnt moving and player x is in right place set image speed to 1
	} else if (moveCam = false and obj_player.x = 256){
		image_speed = 1;
		y += 2;
	}
	// move camera if walking towards ref point
	if (camera.y != 264 and moveCam = true){
		camera.y = Approach(camera.y, 264, 1);
	}
	// if has walked enough distance, remove from scene
	if (y = 450){
		instance_destroy(self);
	}
}

// move player out of the way after dialogue
if (managerPass = true){
	moveCam = false;
	if (obj_player.x != 256){
		obj_player.sprite_index = spr_player_leftwalk_coat;
		obj_player.image_speed = 1;
		obj_player.x = Approach(obj_player.x, 256, 2);
	} else {
		// after moving out of the way freeze player and resume moving
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		isWalking = true;
	}
}

// if manager isnt walking stop animation
if (isWalking = false){
	image_index = 0;
	image_speed = 0;
}

// if no inventory and manager collides with player start dialogue
if (!global.inventoryOpen and isWalking = true){
	if(obj_player.active_textbox == noone){
		if (runOnce = false){
			var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_player, false, true);
			if(inst != noone){
				isWalking = false;
				global.name_text_col = c_ltgray;
				var tbox = create_textbox(text, speakers, next_line, scripts);
				obj_player.active_textbox = tbox;
			}
		}
	} 
}
