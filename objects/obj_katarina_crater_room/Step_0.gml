
if (instance_exists(obj_facetextbox)){
	obj_textbox.portrait = portrait;
	obj_textbox.portrait_index = portrait_index;
}

if (moveForward = true){
	obj_player.y++;
	y++;
}

if (y = 133 and moveForward = true){
	
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	
	image_speed = 0;
	image_index = 0;
	
	moveForward = false;
	craterTextbox = true;
}

if (craterTextbox = true and !instance_exists(obj_textbox)){
	create_facetextbox(text, speakers, next_line, scripts);
	craterTextbox = false;
}

if (moveCam){
	if (camera.y != 272){
		camera.y = Approach(camera.y, 275, 1);
	}
	else if (camera.y = 272 and y != 175){
		image_speed = 1;
		y++;
	}
	else if (y = 175){
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_kat_bendover;
	}
}


