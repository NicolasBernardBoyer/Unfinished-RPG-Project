function state_idle() {
	// lock movement
	if (instance_exists(obj_textbox) || global.pause || global.do_transition || !can_move){
		image_speed = 0;
		return;
	}
	
	// read input
	h_input = global.hr - global.hl;
	v_input = global.hd - global.hu;
	
	// switch to free state
	if (h_input != 0 || v_input != 0) {
		image_speed = 1;
		state = state_free;
		return;
	}
	
	// stay idle animation
	image_speed = 0;
	image_index = 0;
	
	// freeze on last frame if not moving
	time_source_start(steploop);
}

// state if player is able to move
function state_free() {
	// only allow movement if these conditions are met (double-checking)
	if (instance_exists(obj_textbox) || global.do_transition || global.pause || !can_move) {
		state = state_idle();
		return;
	}
	
	// input
	h_input = global.hr - global.hl;
	v_input = global.hd - global.hu;

	// if player is inputting
	if (h_input == 0 && v_input == 0) {
		state = state_idle;
		return;
	}

	// change speed depending on input
	if (global.hrun){
		spd = 3;
	} else {
		spd = 2;
	}

	hsp = h_input*spd;
	vsp = v_input*spd;
	
	// facing direction calculation
	var dir = point_direction(0, 0, h_input, v_input);
	dir = (dir + 360) mod 360;

	// Interrupt movement when meeting a wall
	if place_meeting(x + hsp, y, obj_wall) || place_meeting(x + hsp, y, obj_par_roadblock)
	{
		hsp = 0;
		if (vsp = 0) {
			image_speed = 0;
			image_index = 0;
		}
	}
	if place_meeting(x, y + vsp, obj_wall) || place_meeting(x, y + vsp, obj_par_roadblock)
	{
		vsp = 0;
		if (hsp = 0) {
			image_speed = 0;
			image_index = 0;
		}
	}
	
	// play step sfx in player's house
	// TODO probably remove this, its another detail that doesn't really matter right now, plus characters
	// wont be wearing shoes
	if (room = rm_yourbedroom or room = rm_yourbathroom or room = rm_yourhallway){
		if (hsp != 0 or vsp != 0){
			if (count = 0){
				p=random_range(.9,1.1);
				audio_sound_pitch(snd_step,p);
				audio_play_sound(snd_step, 5, false);
			}
			if (image_speed = 1){
				count++;
			} else {
				count += 1.5;
			}
			if (count >= 22){
				count = 0;
			}
		}
	}

	// add movement to player
	x += hsp;
	y += vsp;

	
	// This region is for setting the sprite depending on the state of the player
	s_down = spr_player_walk;
	s_right = spr_player_rightwalk;
	s_left = spr_player_leftwalk;
	s_up = spr_player_upwalk;
	
	update_player_sprite(dir);

	// set the last fram to 1 higher than the current frame
	if (image_index != 3){
		lastframe = image_index+1;
	} else {
		lastframe = 0;
	}
	#endregion
}

function update_player_sprite(dir) {
	switch(dir){
		case DIR.right: sprite_index = s_right; facing = DIR.right; break;
		case 45: 
		if (sprite_index = s_right /*or sprite_index = spr_player_leftwalk*/){
		sprite_index = s_right; facing = DIR.right;
		}
		else if (sprite_index = s_up or sprite_index = s_down){
		sprite_index = s_up; facing = DIR.up;
		}
		break;
		case 90: sprite_index = s_up; facing = DIR.up; break;
		case 135: 
		if (sprite_index = s_left /*or sprite_index = spr_player_rightwalk*/){
		sprite_index = s_left; facing = DIR.left;
		}
		else if (sprite_index = s_up or sprite_index = s_down){
		sprite_index = s_up; facing = DIR.up;
		}
		break;
		case 180: sprite_index = s_left; facing = DIR.left; break;
		case 225: 
		if (sprite_index = s_left /*or sprite_index = spr_player_rightwalk*/){
		sprite_index = s_left; facing = DIR.left;
		}
		else if (sprite_index = s_down  or sprite_index = s_up){
		sprite_index = s_down; facing = DIR.down;
		}
		break;
		case 270: sprite_index = s_down; facing = DIR.down; break;
		case 315: 
		if (sprite_index = s_right /* or sprite_index = spr_player_leftwalk */){
		sprite_index = s_right; facing = DIR.right;
		}
		else if (sprite_index = s_down or sprite_index = s_up){
		sprite_index = s_down; facing = DIR.down;
		}
		break;
	} 
}

// prevent movement options if in cutscene state
state_cutscene = function() {

}