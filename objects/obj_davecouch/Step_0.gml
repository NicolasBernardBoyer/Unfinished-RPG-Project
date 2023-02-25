// if the cutscene hasn't run once before, do this
if (runOnce = false){
	// if the player hasn't hit 319 Y yet.
	if (obj_player.y >= 319){
		// stop player movement and pausing
		moveCam = true;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		obj_player.canMove = false;
		global.canPause = false;
	}
	// move the camera towards Dave
	if (moveCam = true){
		camera.following = noone;
		camera.y = Approach(camera.y, 382, 1);
	}
	
	// when the camera is in the right stop, created the textbox
	if (camera.y >= 382 and !instance_exists(obj_textbox)){
		image_index = 0;
		create_facetextbox(evtext, evspeakers, evnext_line, evscripts);
		runOnce = true;
	}
}

// move the camera back and end the cutscene
if (runOnce = true and !instance_exists(obj_textbox)){
	if (camera.y = obj_player.y){
		camera.following = obj_player;
		obj_player.canMove = true;
		global.canPause = true;
		moveCam = false;
	} else if (moveCam = true) {
		camera.y = Approach(camera.y, obj_player.y, 1);
	}
}

// change dave's dialogue after the scene is done
if (interactCh = true){
	text = alttext;
	speakers = altspeakers;
	next_line = altnext_line;
	scripts = altscripts;
}






