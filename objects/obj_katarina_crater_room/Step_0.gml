

// Make player walk forward
if (moveForward = true){
	obj_player.y++;
	y++;
}

// Once kat has hit a certain point, stop movement and animation
if (y = 133 and moveForward = true){
	
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	
	image_speed = 0;
	image_index = 0;
	
	moveForward = false;
	// then use this variable to create a textbox
	craterTextbox = true;
}

// create a textbox
if (craterTextbox = true and !instance_exists(obj_textbox)){
	create_textbox(text, speakers, next_line, scripts);
	craterTextbox = false;
}

// if the camera is ordered to move, move it towards the crater
if (moveCam){
	if (camera.y != 189){
		camera.y = Approach(camera.y, 275, 1);
	}
	// have katarina move towards the hole
	else if (camera.y = 189 and y != 175){
		image_speed = 1;
		y++;
	}
	// have katarina look down into the hole
	else if (y = 175){
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_kat_bendover;
	}
}

// when the sprite, create a textbox after a delay
if (sprite_index = spr_kat_bendover and runOnce = true){
	time_source_start(textboxDelay);
	runOnce = false;
}

// Once the textbox's done and the new variable is true, create another textbox
if (runChoice = true and !instance_exists(obj_textbox)){
	create_textbox(text3, speakers3, next_line3, scripts3);
	runChoice = false;
}

// Have the player also approach the crater
if (stareChoice = true and cutProg = 0){
	if (obj_player.y != 173){
		obj_player.image_speed = 1;
		obj_player.y++;
	}
	if (obj_player.y = 173){
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		
		// Once the player reaches the hole, have kat notice after a del
		// if kat's sprite hasn't changed yet activate the timer
		if (sprite_index != spr_kat_bendover_lookright and runOnce2 = true){
			time_source_start(katReact);
			runOnce2 = false;
		}
	}
}

// change Katarina's sprite a second time to make her look up
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

// create the last textbox
if (cutProg = 2 and !instance_exists(obj_textbox)){
	portrait_index = 14;
	voice = snd_meow;
	create_textbox(text4,speakers4,next_line4,scripts4);
	if (cutProg = 2) cutProg++;
}

// After the last textbox, the cliff's event is triggered which continues the cutscenes


