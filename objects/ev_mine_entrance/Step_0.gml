if (instance_exists(obj_textbox)){
	with (obj_textbox){
		if (portrait != noone){
			portrait_index = ev_mine_entrance.portrait_index;
			portrait = ev_mine_entrance.portrait;
		}
	}
}

switch (cutProg){
	case 0:
	// At the beginning make the player and kat fall until they hit a certain point
	if (obj_player.y < 180){
		obj_player.y += 8;
		obj_kat.y += 8;
		obj_bubble.y += 8;
	} else {
		cutProg++;
	}
	break;
	case 1:
	// Break the bubble once they hit the ground
	with (obj_bubble){
		if (sprite_index != noone){
			sprite_index = spr_bubble_shield_break;
			image_speed = 1;
			// Once the animation is finished, destroy the bubble
			// Create particles in its place, and make it invisible
			if (sprite_index = spr_bubble_shield_break and image_index = 2){
				part_particles_create(global.partSystem, x, y-50, global.ptGlass, 80);
				audio_play_sound(snd_glassbreak, 5, false);
				audio_play_sound(snd_catscreaming, 6, false);
				sprite_index = noone;
			}
		}
	}
	// Once the bubble has no sprite (it is destroyed), proceed.
	// Change the fall animations of the party and set them to one frame
	if (obj_bubble.sprite_index = noone){
		obj_player.image_speed = 0;
		obj_player.sprite_index = spr_player_face_fall;
		obj_kat.image_speed = 0;
		obj_kat.sprite_index = spr_kat_landing;
		//make curve speed increase to give the illusion of accelerated falling
		curvePos += curveSpeed;
		//curvePos = curvePos mod 1;
		//Apply curve's x and y channel
		var _curveStruct = animcurve_get(curve);
		//channels
		var _ychannel = animcurve_get_channel(_curveStruct, "y");
		var _xchannel = animcurve_get_channel(_curveStruct, "x");
		//values
		var _yvalue = animcurve_channel_evaluate(_ychannel, curvePos);
		var _xvalue = animcurve_channel_evaluate(_xchannel, curvePos);		

		if (obj_player.y <= 190){
			obj_player.y += _yvalue;
			obj_kat.y += _yvalue;
		}
		if (obj_player.x <= 280){
			obj_player.x += _xvalue;
			obj_kat.x -= _xvalue;
		}
		// Play landing sfx and change sprite once they land for good
		if (obj_player.x >= 280 and obj_player.y >= 190){
			obj_player.image_index = 1;
			obj_kat.image_index = 1;
			audio_play_sound(snd_punch, 5, false);
			cutProg++;
		}
	}
	break;
	case 2:
	// Wait a little bit before creating the textbox
	time_source_start(twoSeconds1);
	break;
	case 3:
	with obj_kat {
		// Make kat dust off, and then play a sound every 2 frames
		// Of the animation
		if (sprite_index = spr_kat_dustoff){
			if (image_index = 8){
				image_speed = 0;
			} else if (image_index = 2){
				audio_play_sound(snd_move, 5, false);
			} else if (image_index = 4){
				audio_play_sound(snd_move, 5, false);
			} else if (image_index = 6){
				audio_play_sound(snd_move, 5, false);
			}
		}	
	}
	// Once the animation has finished, wait before continuing again
	if (obj_kat.sprite_index = spr_kat_dustoff and obj_kat.image_index = 8){
		time_source_start(twoSeconds2);
	}
	break;
	case 4:
	// Make the player stand up
	with (obj_player){
		if (sprite_index = spr_player_face_fall){
			image_index = 0;
			audio_play_sound(snd_move, 2, false);
			sprite_index = spr_player_leftwalk_coat;
		}
	}
	// Start the player's 
	if (obj_player.sprite_index = spr_player_leftwalk_coat){
		time_source_start(part4);
	}
	break;
	case 5:
	//Change textbox attributes for no portrait (dont do this again), use speakers
	if (!instance_exists(obj_textbox)){
		name = "";
		voice = noone;
		// notify that katarina has joined the party
		audio_play_sound(snd_partyup, 5, false);
		create_textbox(text4, speakers4, next_line4, scripts4);
		obj_textbox.text_col = c_yellow;
	}
	break;
	case 6:
	// If there is no textbox, make kat walk towards the player
	// When her x equals 250, stop the walking but with a delay
	if (!instance_exists(obj_textbox)){
		with (obj_kat) {
			if (x <= 250){
				image_speed = 1;
				x+=2;
			} else if (x >= 250){
				image_speed = 0;
			}
		}
		if (obj_kat.x >= 250){
			time_source_start(spritewait);
		}
	}
	break;
	case 7:
		/* End the cutscene, let the player move, make the camera follow
	the player again. Destroy this event. */
	with (obj_player){
		canMove = true;
		state = stateFree;
	}
	global.canPause = true;
	global.highbox = false;
	camera.following = obj_player;
	instance_destroy(self);
	
	break;
}
