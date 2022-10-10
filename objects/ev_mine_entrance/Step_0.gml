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
				sprite_index = noone;
			}
		}
	}
	if (obj_bubble.sprite_index = noone){
		obj_player.sprite_index = spr_player_face_fall;
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
		if (obj_player.x <= 260){
			obj_player.x += _xvalue;
			obj_kat.x -= _xvalue;
		}
	}
	break;
	case 2:
	
	break;
}
