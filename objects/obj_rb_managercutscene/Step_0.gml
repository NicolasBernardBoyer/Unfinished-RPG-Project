// Normal collision rectangle code
var inst = collision_rectangle(x-radius_x, y-radius_y, x+radius_x, y+radius_y, obj_player, false, true);
if (inst!=noone){
	if (run_once == false){
		// Run the cutscene
		if (!instance_exists(obj_textbox)) {
			global.highbox = true;
			create_textbox(text, speakers, next_line, scripts);
			run_once = true;
		}
	}
} else if (!place_meeting(x,y,obj_player)){
	run_once = false;
}
// Take this code and put it into a parent later

//runs if there is a player and the manager hasnt been created yet
if (instance_exists(obj_player) and create_manager = true){
	//if the player can approach and their x isnt 223
	if (player_approach = true and obj_player.x != 223){
		//move player depending if they are on the left or right to the reference point
		obj_player.x = approach(obj_player.x, 223, 3);
		if (obj_player.x < 223){
			obj_player.sprite_index = spr_player_rightwalk_coat;
			obj_player.image_speed = 1;
		} else if (obj_player.x > 223){
			obj_player.sprite_index = spr_player_leftwalk_coat;
			obj_player.image_speed = 1;
		}
	} else if (obj_player.x = 223 and player_approach = true){
		//If the player is at the right position, proceed with the cutscene
		//make the player look upwards and move the obj_camera upwards
		obj_player.sprite_index = spr_player_upwalk_coat;
		obj_player.image_index = 0;
		obj_player.vspeed = 0;
		obj_player.image_speed = 0;
		move_cam = true;
		// stop this part of the cutscene and stop the obj_camera from following the player
		player_approach = false;
		obj_camera.following = noone;
	}
	if (move_cam = true){
		//If the manager object isnt there yet, move the obj_camera to the right position
		if (!instance_exists(obj_manager)){
			if (obj_camera.y != 220){
				obj_camera.y = approach(obj_camera.y, 220, 2);
			}
			//if the obj_camera is in the right player and there is no manager, create one only once
			if (obj_camera.y = 220 and !instance_exists(obj_manager) and create_manager = true){
				instance_create_layer(223, 95, "Instances", obj_manager);
				create_manager = false;
			}
		}
	}
}
//if there is no manager and the manager was created before, end the cutscene
if (create_manager = false and !instance_exists(obj_manager)){
	//move the obj_camera back towards the player
	if (obj_camera.x != obj_player.x){
		obj_camera.x = approach(obj_camera.x, obj_player.x, 2);
	}
	if (obj_camera.y != obj_player.y){
		obj_camera.y = approach(obj_camera.y, obj_player.y, 2);
	}
	//if the obj_camera is in the right position let the player move again
	//and change the obj_camera back to following the player, then destroy this event
	if (obj_camera.y = obj_player.y){			
		global.can_pause = true;
		obj_player.can_move = true;
		obj_camera.following = obj_player;
		global.highbox = false;
		instance_activate_object(obj_rb_gotowork);
		instance_destroy(self);
	}
}


