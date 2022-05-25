if (isWalking = true){
	if (moveCam = true){
		y += 2;
	} else if (moveCam = false and obj_player.x = 256){
		image_speed = 1;
		y += 2;
	}
	if (camera.y != 264 and moveCam = true){
		camera.y = Approach(camera.y, 264, 1);
	}
	if (y = 415){
		instance_destroy(self);
	}
}

if (managerPass = true){
	moveCam = false;
	if (obj_player.x != 256){
		obj_player.sprite_index = spr_player_leftwalk_coat;
		obj_player.image_speed = 1;
		obj_player.x = Approach(obj_player.x, 256, 2);
	} else {
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		isWalking = true;
	}
}

if (isWalking = false){
	image_index = 0;
	image_speed = 0;
}

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
