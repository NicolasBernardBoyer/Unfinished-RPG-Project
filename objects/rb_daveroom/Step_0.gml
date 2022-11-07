var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){
	if (runOnce == false){
		if (!instance_exists(obj_facetextbox)) {
			create_facetextbox(text, speakers, next_line, scripts);
			obj_davecouch.image_index = 4;
			obj_facetextbox.portrait_index = portrait_index;
			runOnce = true;
		}
	}
	
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

