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
	break;
}
