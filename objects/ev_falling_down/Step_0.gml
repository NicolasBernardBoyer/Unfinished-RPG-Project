if (instance_exists(obj_facetextbox)){
obj_textbox.portrait_index = portrait_index;
obj_textbox.portrait = portrait;
}

if (!audio_is_playing(snd_wind)){
	audio_play_sound(snd_wind, 5, false);
}

if(obj_player.y != 98 and cutProg = 0){
	obj_player.y++;
	obj_kat_falling.y++;
}

if (cutProg = 0 and obj_player.y = 98) cutProg++;

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

if (cutProg = 1 and !instance_exists(obj_textbox)){
	obj_kat_falling.sprite_index = spr_kat_fall_angry;
	create_facetextbox(text, speakers, next_line, scripts);
}