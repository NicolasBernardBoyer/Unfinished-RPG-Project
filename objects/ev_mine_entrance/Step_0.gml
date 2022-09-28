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
	
	break;
}
