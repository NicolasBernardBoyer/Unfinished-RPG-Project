
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
	if (camera.y != 189){
		camera.y = Approach(camera.y, 275, 1);
	}
	else if (camera.y = 189 and y != 175){
		image_speed = 1;
		y++;
	}
	else if (y = 175){
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_kat_bendover;
	}
}

if (sprite_index = spr_kat_bendover){
	textboxDelay = time_source_create(time_source_game, 60, time_source_units_frames, function()
	{
		if (moveCam = true and !instance_exists(obj_textbox)){
			portrait_index = 13;
			create_facetextbox(text2, speakers2, next_line2, scripts2);
			moveCam = false;
		}
		time_source_stop(textboxDelay);
	}, [], -1);
	time_source_start(textboxDelay);
}

if (runChoice = true and !instance_exists(obj_textbox)){
	voice = global.s_typewriter;
	create_textbox(text3, speakers3, next_line3, scripts3);
	runChoice = false;
}

if (stareChoice = true and cutProg = 0){
	if (obj_player.y != 173){
		obj_player.image_speed = 1;
		obj_player.y++;
	}
	if (obj_player.y = 173){
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		
		katReact = time_source_create(time_source_game, 90, time_source_units_frames, function()
		{
			if (sprite_index != spr_kat_bendover_lookright and cutProg = 0){
				sprite_index = spr_kat_bendover_lookright;
				instance_create_layer(x, y-55,"Text", obj_exclamation);
				if (cutProg = 0){
					cutProg++;
				}		
			}
		time_source_stop(katReact);
		}, [], -1);
		if (sprite_index != spr_kat_bendover_lookright){
			time_source_start(katReact);
		}
	}
}

if (obj_player.y = 173 and cutProg = 1 and sprite_index != spr_kat_lookright){
	switchSprite1 = time_source_create(time_source_game, 90, time_source_units_frames, function()
	{
		if (sprite_index != spr_kat_lookright and cutProg = 1){
			sprite_index = spr_kat_lookright;
			cutProg++;
		}
		time_source_stop(switchSprite1);
	}, [], -1);
	time_source_start(switchSprite1);
}

if (cutProg = 2 and !instance_exists(obj_textbox)){
	portrait_index = 14;
	voice = snd_meow;
	create_facetextbox(text4,speakers4,next_line4,scripts4);
	if (cutProg = 2) cutProg++;
}


