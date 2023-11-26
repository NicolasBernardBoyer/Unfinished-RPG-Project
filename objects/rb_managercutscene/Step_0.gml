// Normal collision rectangle code
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);
if (inst!=noone){
	if (runOnce == false){
		// Run the cutscene
		if (!instance_exists(obj_textbox)) {
			global.highbox = true;
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
	}
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}
// Take this code and put it into a parent later

//runs if there is a player and the manager hasnt been created yet
if (instance_exists(obj_player) and createManager = true){
	//if the player can approach and their x isnt 223
	if (playerApproach = true and obj_player.x != 223){
		//move player depending if they are on the LEFT or RIGHT to the reference point
		obj_player.x = Approach(obj_player.x, 223, 3);
		if (obj_player.x < 223){
			obj_player.sprite_index = spr_player_rightwalk_coat;
			obj_player.image_speed = 1;
		} else if (obj_player.x > 223){
			obj_player.sprite_index = spr_player_leftwalk_coat;
			obj_player.image_speed = 1;
		}
	} else if (obj_player.x = 223 and playerApproach = true){
		//If the player is at the RIGHT position, proceed with the cutscene
		//make the player look UPwards and move the camera UPwards
		obj_player.sprite_index = spr_player_upwalk_coat;
		obj_player.image_index = 0;
		obj_player.vspeed = 0;
		obj_player.image_speed = 0;
		moveCam = true;
		// stop this part of the cutscene and stop the camera from following the player
		playerApproach = false;
		camera.following = noone;
	}
	if (moveCam = true){
		//If the manager object isnt there yet, move the camera to the RIGHT position
		if (!instance_exists(obj_manager)){
			if (camera.y != 220){
				camera.y = Approach(camera.y, 220, 2);
			}
			//if the camera is in the RIGHT player and there is no manager, create one only once
			if (camera.y = 220 and !instance_exists(obj_manager) and createManager = true){
				instance_create_layer(223, 95, "Instances", obj_manager);
				createManager = false;
			}
		}
	}
}
//if there is no manager and the manager was created before, end the cutscene
if (createManager = false and !instance_exists(obj_manager)){
	//move the camera back towards the player
	if (camera.x != obj_player.x){
		camera.x = Approach(camera.x, obj_player.x, 2);
	}
	if (camera.y != obj_player.y){
		camera.y = Approach(camera.y, obj_player.y, 2);
	}
	//if the camera is in the RIGHT position let the player move again
	//and change the camera back to following the player, then destroy this event
	if (camera.y = obj_player.y){			
		global.can_pause = true;
		obj_player.can_move = true;
		camera.following = obj_player;
		global.highbox = false;
		instance_activate_object(rb_gotowork);
		instance_destroy(self);
	}
}


