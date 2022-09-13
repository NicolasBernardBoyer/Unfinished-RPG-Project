if (instance_exists(obj_facetextbox)){
obj_textbox.portrait_index = portrait_index;
obj_textbox.portrait = portrait;
}

if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 5, false);
}

switch (cutProg){
	case 0:
		if(obj_player.y != 98){
			obj_player.y++;
			obj_kat_falling.y++;
		}
		if (obj_player.y = 98) cutProg++;
	break;
	case 1:
		if (!instance_exists(obj_textbox)){
			obj_kat_falling.sprite_index = spr_kat_fall_angry;
			create_facetextbox(text, speakers, next_line, scripts);
		}
	break;
	case 2:
		if (sorryChoice or blameChoice or deathChoice){
		cutProg++;
	}
	else if (!instance_exists(obj_textbox)){
		create_textbox(text2, speakers2, next_line2, scripts2);
	}
	break;
	case 3:
		obj_kat_falling.sprite_index = spr_kat_fall_lookright;
		if (!instance_exists(obj_textbox)){
			if (sorryChoice){
				portrait_index = 13;
				create_facetextbox(text3, speakers3, next_line3, scripts3);
			} else if (blameChoice){
				portrait_index = 10;
				create_facetextbox(text4, speakers4, next_line4, scripts4);
			} else if (deathChoice){
				portrait_index = 9;
				create_facetextbox(text5, speakers5, next_line5, scripts5);
			}
		}
	break;
	case 4:
		staffPull = time_source_create(time_source_game, 40, time_source_units_frames, function(){
		with (obj_kat_falling){
			if (sprite_index != spr_kat_staffpull){
				audio_play_sound(snd_fling2, 10, false);
				image_index = 0;
				sprite_index = spr_kat_staffpull;
			}
			if (image_index = 7){
				image_speed = 0;
				ev_falling_down.cutProg++;
			}
		}
		}, [], 1);
		time_source_start(staffPull);
	break;
	case 5:
	approachTextbox = time_source_create(time_source_game, 45, time_source_units_frames, function(){
		portrait_index = 0;
		create_facetextbox(text6,speakers6,next_line6,scripts6);
		}, [], 1);
		time_source_start(approachTextbox);
	break;
}

if (cutProg > 0){
	dropSpeed += 1/60;
	if (dropSpeed > 1) dropSpeed -= 1;
	
	position = animcurve_channel_evaluate(curve,dropSpeed);
	
	var _startplayer = 98;
	var _endplayer = 128;
	var _distanceplayer = _endplayer - _startplayer;
	
	var _startkat = 98;
	var _endkat = 128;
	var _distancekat = _endkat - _startkat;
	
	obj_player.y = _startplayer + (_distanceplayer * position);
	obj_kat_falling.y = _startkat + (_distancekat * position);
}