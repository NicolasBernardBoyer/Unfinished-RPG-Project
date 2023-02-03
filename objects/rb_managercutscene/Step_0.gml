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


if (instance_exists(obj_player) and createManager = true){
	if (playerApproach = true and obj_player.x != 223){
		obj_player.x = Approach(obj_player.x, 223, 3);
		if (obj_player.x < 223){
			obj_player.sprite_index = spr_player_rightwalk_coat;
		} else if (obj_player.x > 223){
			obj_player.sprite_index = spr_player_leftwalk_coat;
		}
	} else if (obj_player.x = 223 and playerApproach = true){
		obj_player.sprite_index = spr_player_upwalk_coat;
		obj_player.image_index = 0;
		obj_player.vspeed = 0;
		obj_player.image_speed = 0;
		moveCam = true;
		playerApproach = false;
		camera.following = noone;
	}
	if (moveCam = true){
		if (!instance_exists(obj_manager)){
			if (camera.x != 224){
				camera.x = Approach(camera.x, 224, 2);
			}
			if (camera.y != 220){
				camera.y = Approach(camera.y, 220, 2);
			}
			if (camera.x = 224 and camera.y = 220 and !instance_exists(obj_manager) and createManager = true){
				instance_create_layer(223, 95, "Instances", obj_manager);
				createManager = false;
			}
		}
	}
}
if (createManager = false and !instance_exists(obj_manager)){
	if (camera.x != obj_player.x){
		camera.x = Approach(camera.x, obj_player.x, 2);
	}
	if (camera.y != obj_player.y){
		camera.y = Approach(camera.y, obj_player.y, 2);
	}
	if (camera.y = obj_player.y){			
		global.canPause = true;
		obj_player.canMove = true;
		camera.following = obj_player;
		global.highbox = false;
		instance_activate_object(rb_gotowork);
		instance_destroy(self);
	}
}


