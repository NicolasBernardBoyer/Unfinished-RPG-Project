if (runOnce = false){
	if (obj_player.y >= 319){
		moveCam = true;
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		obj_player.canMove = false;
		global.canPause = false;
	}

	if (moveCam = true){
		camera.following = noone;
		camera.y = Approach(camera.y, 382, 1);
	}

	if (camera.y >= 382 and !instance_exists(obj_textbox)){
		image_index = 0;
		create_facetextbox(evtext, evspeakers, evnext_line, evscripts);
		runOnce = true;
	}
}

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

if (interactCh = true){
	text = alttext;
	speakers = altspeakers;
	next_line = altnext_line;
	scripts = altscripts;
}






