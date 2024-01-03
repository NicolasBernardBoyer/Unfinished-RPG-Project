// if the cutscene hasn't run once before, do this
if (run_once = false){
	// if the player has hit 319 Y yet.
	if (obj_player.y >= 319){
		// stop player movement and pausing
		move_cam = true;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		obj_player.can_move = false;
		global.can_pause = false;
	}
	// move the obj_camera towards Dave
	if (move_cam = true){
		obj_camera.following = noone;
		obj_camera.y = approach(obj_camera.y, 382, 1);
	}
	
	// when the obj_camera is in the right stop, created the textbox
	if (obj_camera.y >= 382 and !instance_exists(obj_textbox)){
		image_index = 0;
		create_textbox(evtext, evspeakers, evnext_line, evscripts);
		run_once = true;
	}
}

// move the obj_camera back and end the cutscene
if (run_once = true and !instance_exists(obj_textbox)){
	if (obj_camera.y = obj_player.y){
		obj_camera.following = obj_player;
		obj_player.can_move = true;
		global.can_pause = true;
		move_cam = false;
	} else if (move_cam = true) {
		obj_camera.y = approach(obj_camera.y, obj_player.y, 1);
	}
}

// change dave's dialogue after the scene is done
if (interact_ch = true){
	text = alttext;
	speakers = altspeakers;
	next_line = altnext_line;
	scripts = altscripts;
}






