

// Make player walk forward
if (move_forward = true){
	obj_player.y++;
	y++;
}

// Once kat has hit a certain point, stop movement and animation
if (y = 133 and move_forward = true){
	
	obj_player.image_speed = 0;
	obj_player.image_index = 0;
	
	image_speed = 0;
	image_index = 0;
	
	move_forward = false;
	// then use this variable to create a textbox
	crater_textbox = true;
}

// create a textbox
if (crater_textbox = true and !instance_exists(obj_textbox)){
	create_textbox(text, speakers, next_line, scripts);
	crater_textbox = false;
}

// if the obj_camera is ordered to move, move it towards the crater
if (move_cam){
	if (obj_camera.y != 189){
		obj_camera.y = approach(obj_camera.y, 275, 1);
	}
	// have katarina move towards the hole
	else if (obj_camera.y = 189 and y != 175){
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
if (sprite_index = spr_kat_bendover and run_once = true){
	time_source_start(textbox_delay);
	run_once = false;
}

// Once the textbox's done and the new variable is true, create another textbox
if (run_choice = true and !instance_exists(obj_textbox)){
	create_textbox(text3, speakers3, next_line3, scripts3);
	run_choice = false;
}

// Have the player also approach the crater
if (stare_choice = true and cut_prog = 0){
	if (obj_player.y != 173){
		obj_player.image_speed = 1;
		obj_player.y++;
	}
	if (obj_player.y = 173){
		obj_player.image_speed = 0;
		obj_player.image_index = 0;
		
		// Once the player reaches the hole, have kat notice after a del
		// if kat's sprite hasn't changed yet activate the timer
		if (sprite_index != spr_kat_bendover_lookright and run_once2 = true){
			time_source_start(kat_react);
			run_once2 = false;
		}
	}
}

// change Katarina's sprite a second time to make her look up
if (obj_player.y = 173 and cut_prog = 1 and sprite_index != spr_kat_lookright){
	switch_sprite1 = time_source_create(time_source_game, 90, time_source_units_frames, function()
	{
		if (sprite_index != spr_kat_lookright and cut_prog = 1){
			sprite_index = spr_kat_lookright;
			cut_prog++;
		}
		time_source_stop(switch_sprite1);
	}, [], -1);
	time_source_start(switch_sprite1);
}

// create the last textbox
if (cut_prog = 2 and !instance_exists(obj_textbox)){
	portrait_index = 14;
	voice = snd_meow;
	create_textbox(text4,speakers4,next_line4,scripts4);
	if (cut_prog = 2) cut_prog++;
}

// After the last textbox, the cliff's event is triggered which continues the cutscenes


