var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);

if (inst!=noone){

	if (runOnce == false){
	if (global.hasCoat == true){
		
		// Tell the player they can't leave
		if (!instance_exists(obj_textbox)) {
			name = "";
			voice = snd_typewriter;
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
		} else {
			instance_destroy();
		}
	}
	
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}

if (davePart = true and !instance_exists(obj_textbox)){
	name = "Dave";
	create_facetextbox(davetext,davespeakers,davenext_line,davescripts);
	davePart = false;
}

