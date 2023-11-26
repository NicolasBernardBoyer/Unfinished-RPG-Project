// handle transition when exiting a room
if(global.do_transition){
	//Handle Black Fade/Room Transition
	if(room != spawn_room){
		blackAlpha += 0.1;
		if(blackAlpha >= 1){ room_goto(spawn_room) }
	} else {
		blackAlpha -= 0.1;
		if(blackAlpha <= 0) { global.do_transition = false;
			global.can_pause = true;
		}
	}
	
	//Draw Black Fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0,0, global.game_width, global.game_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}