// Set portrait for the textbox
if (instance_exists(obj_textbox)){
	if (portrait != noone){
		obj_textbox.portrait_index = portrait_index;
		obj_textbox.portrait = portrait;
	}
}

// Play wind sfx in this room if it is not already playing
if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 5, false);
}

// Switch statement for cutscene progression
switch (cutProg){
	case 0:
		if(obj_player.y != 157){
			obj_player.y++;
			obj_kat.y++;
		}
		if (obj_player.y = 157) cutProg++;
	break;
	case 1:
		if (!instance_exists(obj_textbox)){
			obj_kat.sprite_index = spr_kat_fall_angry;
			create_textbox(text, speakers, next_line, scripts);
		}
	break;
	case 2:
		obj_kat.sprite_index = spr_kat_fall_lookright;
	break;
	case 4:
		staffPull = time_source_create(time_source_game, 40, time_source_units_frames, function(){
		with (obj_kat){
				if (sprite_index != spr_kat_staffpull and sprite_index != spr_kat_stafffall){
					audio_play_sound(snd_fling2, 10, false);
					image_index = 0;
					sprite_index = spr_kat_staffpull;
				}
				else if (sprite_index = spr_kat_staffpull and image_index = 8){
					sprite_index = spr_kat_stafffall;
					ev_falling_down.cutProg++;
				}
			}
		}, [], 1);
		time_source_start(staffPull);
	break;
	case 5:
		approachTextbox = time_source_create(time_source_game, 45, time_source_units_frames, function(){
			if (!instance_exists(obj_textbox) and cutProg = 5){
				portrait_index = 0;
				create_facetextbox(text6,speakers6,next_line6,scripts6);
			}
		}, [], 1);
		time_source_start(approachTextbox);
	break;
	case 6:
	with(obj_player){
		if (x != 120){
			x -= 1;
			obj_kat.x += 1;
		} else {
			if (obj_kat.sprite_index != spr_kat_staffbubble){
				obj_kat.image_index = 0;
			}
			obj_kat.sprite_index = spr_kat_staffbubble;
			if (!audio_is_playing(snd_magicup)){
				audio_play_sound(snd_magicup, 1, false);
			}
			ev_falling_down.cutProg++;
		}
	}
	break;
	case 7:
	with (obj_kat){
		if (sprite_index = spr_kat_staffbubble and image_index = 6){
			sprite_index = spr_kat_staffbubble_idle;
		}
	}
	if (!instance_exists(obj_bubble)){
		instance_create_layer(95, 199, "Instances", obj_bubble);
	} else {
		if (obj_bubble.image_index = 4){
			obj_bubble.image_speed = 0;
			cutProg8 = time_source_create(time_source_game, 120, time_source_units_frames, function(){
			if (cutProg = 7){
				cutProg++;
			}
			}, [], 1);
			time_source_start(cutProg8);
		}
	}
	break;
	case 8:
	{
		obj_game.spawnX = 224;
		obj_game.spawnY = 2;
		obj_game.spawnRoom = rm_mine_entrance;
		obj_game.doTransition = true;
	}
}

if (cutProg > 0){
	dropSpeed += 1/60;
	if (dropSpeed > 1) dropSpeed -= 1;
	
	position = animcurve_channel_evaluate(curve,dropSpeed);
	
	var _startplayer = 157;
	var _endplayer = 187;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = 157;
	var _endkat = 187;
	var _distancekat = _endkat - _startkat;
	
	var _startbubble = 199;
	var _endbubble = 209;
	var _distancebubble = _endbubble - _startbubble;
	
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_kat.y = _startkat + (_distancekat * position);
	
	if (instance_exists(obj_bubble) and obj_bubble.image_index = 4){
		obj_bubble.y = _startbubble + (_distancebubble * position);
	}
}