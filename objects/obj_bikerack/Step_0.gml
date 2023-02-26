// if the bike stop even exists and player collides, stop the player
if (place_meeting(x, y, obj_player)){
	if (instance_exists(ev_bike_stop)){
		// set textboxes to high
		global.highbox = true;
		audio_stop_sound(global.s_bike);
		alarm[0] = 60;
		// stop biking anim
		with(obj_player){
			image_speed = 0;
		}
		// get rid of event that makes player move
		instance_destroy(ev_bike_stop);
	}
}

// if the fall event is true delay the cutscene where player falls
if (fallEvent = true){
	alarm[1] = 60;
	fallEvent = false;
}
