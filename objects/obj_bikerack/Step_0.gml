if (place_meeting(x, y, obj_player)){
	if (instance_exists(ev_bike_stop)){
		global.highbox = true;
		audio_stop_sound(global.s_bike);
		alarm[0] = 60;
		with(obj_player){
			image_speed = 0;
		}
		instance_destroy(ev_bike_stop);
	}
}

if (fallEvent = true){
	alarm[1] = 60;
	fallEvent = false;
}
