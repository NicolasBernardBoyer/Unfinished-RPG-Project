	// Set portrait for the textbox
if (instance_exists(obj_textbox)){
	if (portrait != noone){
		obj_textbox.portrait_index = obj_kat.portrait_index;
		obj_textbox.portrait = obj_kat.portrait;
	}
}

	// Play wind sfx in this room if it is not already playing
if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 5, false);
}

	// Switch statement for cutscene progression
switch (cutProg){
	case 0:
	with (obj_player){
		state = stateCutscene;
	}
	// If the player y isnt at 157 move them and kat until a certain point
		if(obj_player.y != 157){
			obj_player.y++;
			obj_kat.y++;
		}
	// At that point, progress the cutscene
		if (obj_player.y = 157) cutProg++;
	break;
	case 1:
	// Create a textbox if one doesn't exist
		if (!instance_exists(obj_textbox)){
			obj_kat.sprite_index = spr_kat_fall_angry;
			obj_kat.portrait_index = 1;
			create_textbox(text, speakers, next_line, scripts);
		}
	break;
	case 2:
	// Delayed staff pull animation
		staffPull = time_source_create(time_source_game, 40, time_source_units_frames, function(){
		with (obj_kat){
	// When timer is done, change sprite and play sfx
				if (sprite_index != spr_kat_staffpull and sprite_index != spr_kat_stafffall){
					audio_play_sound(snd_fling2, 10, false);
					image_index = 0;
					sprite_index = spr_kat_staffpull;
				}
	// When animation is done, change the sprite and continue cutscene
				else if (sprite_index = spr_kat_staffpull and image_index = 8){
					sprite_index = spr_kat_stafffall;
					ev_falling_down.cutProg++;
				}
			}
		}, [], 1);
	// Start timer
		time_source_start(staffPull);
	break;
	case 3:
	// Katarina tells the player to move closer to her after a delay
		approachTextbox = time_source_create(time_source_game, 45, time_source_units_frames, function(){
			if (!instance_exists(obj_textbox) and cutProg = 3){
				obj_kat.portrait_index = 0;
				create_textbox(text2,speakers2,next_line2,scripts2);
			}
		}, [], 1);
		time_source_start(approachTextbox);
	break;
	case 4:
	// Move the player closer to Katarina
	with(obj_player){
	// If the player's x isnt 120 keep moving them to the right
		if (x != 120){
			x -= 1;
			obj_kat.x += 1;
		} else {
	// If kat's sprite hasnt changed, switch to first frame of sprite
			if (obj_kat.sprite_index != spr_kat_staffbubble){
				obj_kat.image_index = 0;
			}
	// Then change the sprite and play sfx, then continue cutscene
			obj_kat.sprite_index = spr_kat_staffbubble;
			if (!audio_is_playing(snd_magicup)){
				audio_play_sound(snd_magicup, 1, false);
			}
			ev_falling_down.cutProg++;
		}
	}
	break;
	case 5:
	// Play idle animation once the bubble animation is completed
	with (obj_kat){
		if (sprite_index = spr_kat_staffbubble and image_index = 6){
			sprite_index = spr_kat_staffbubble_idle;
		}
	}
	// If there is no bubble object, create one
	if (!instance_exists(obj_bubble)){
		instance_create_layer(95, 199, "Instances", obj_bubble);
	} else {
	// Otherwise, once the bubble finishes growing, freeze the sprite anim
		if (obj_bubble.image_index = 4){
			obj_bubble.image_speed = 0;
	// Have a timesource for a delay before continuing
			cutProgFinish = time_source_create(time_source_game, 120, time_source_units_frames, function(){
			if (cutProg = 5){
				cutProg++;
			}
			}, [], 1);
			time_source_start(cutProgFinish);
		}
	}
	break;
	case 6:
	{
		// End the cutscene and change rooms
		obj_game.spawnX = 224;
		obj_game.spawnY = 2;
		obj_game.spawnRoom = rm_mine_entrance;
		obj_game.doTransition = true;
	}
}

if (cutProg > 0){
	// float animation
	// float downwards until the speed hits 1, then reset the speed
	dropSpeed += 1/60;
	if (dropSpeed > 1) dropSpeed -= 1;
	
	// initialize animation curve
	position = animcurve_channel_evaluate(curve,dropSpeed);
	
	// Start and end points for variables
	var _startplayer = 157;
	var _endplayer = 187;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = 157;
	var _endkat = 187;
	var _distancekat = _endkat - _startkat;
	
	var _startbubble = 199;
	var _endbubble = 209;
	var _distancebubble = _endbubble - _startbubble;
	
	// add animation curve amount to y variables
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_kat.y = _startkat + (_distancekat * position);
	
	// make the bubble float if it exists and has an img index of 4
	if (instance_exists(obj_bubble) and obj_bubble.image_index = 4){
		obj_bubble.y = _startbubble + (_distancebubble * position);
	}
}