if (instance_exists(obj_facetextbox)){
obj_textbox.portrait_index = portrait_index;
obj_textbox.portrait = portrait;
}

switch (cutProg){
	case 0:
	if (obj_player.y < 180){
		obj_player.y += 8;
		obj_kat.y += 8;
		obj_bubble.y += 8;
	} else {
		cutProg++;
	}
	break;
	case 1:
	with (obj_bubble){
		if (sprite_index != noone){
			sprite_index = spr_bubble_shield_break;
			image_speed = 1;
			if (sprite_index = spr_bubble_shield_break and image_index = 2){
				part_particles_create(global.partSystem, x, y-50, global.ptGlass, 80);
				audio_play_sound(snd_glassbreak, 5, false);
				audio_play_sound(snd_catscreaming, 6, false);
				sprite_index = noone;
			}
		}
	}
	if (obj_bubble.sprite_index = noone){
		obj_player.image_speed = 0;
		obj_player.sprite_index = spr_player_face_fall;
		obj_kat.image_speed = 0;
		obj_kat.sprite_index = spr_kat_landing;
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
		if (obj_player.x >= 280 and obj_player.y >= 190){
			obj_player.image_index = 1;
			obj_kat.image_index = 1;
			audio_play_sound(snd_punch, 5, false);
			cutProg++;
		}
	}
	break;
	case 2:
	
	time_source_start(part2);
	cutProg++;
	break;
	case 3:
	with obj_kat {
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
	if (obj_kat.sprite_index = spr_kat_dustoff and obj_kat.image_index = 8){
		time_source_start(part3);
	}
	break;
	case 4:
	with (obj_player){
		if (sprite_index = spr_player_face_fall){
			image_index = 0;
			audio_play_sound(snd_move, 2, false);
			sprite_index = spr_player_leftwalk_coat;
		}
	}
	if (obj_player.sprite_index = spr_player_leftwalk_coat){
		time_source_start(part4);
	}
	break;
	case 5:
	if (!instance_exists(obj_textbox)){
		name = "";
		voice = snd_typewriter;
		create_textbox(text4, speakers4, next_line4, scripts4);
	}
}
