show_debug_message("Player has been created.");

// speed variables for walking
hsp = 0;
vsp = 0;

// reference variables for walk animations
s_down = spr_player_walk;
s_right = spr_player_rightwalk;
s_left = spr_player_leftwalk;
s_up = spr_player_upwalk;

// initial ability to move and speed, sprite, etc.
can_move = true;
spd = 2;
sprite_index = spr_player_walk;
image_index = 0;
framebefore = 0;
lastframe = 0;
visible = false;

// counter
count = 0;

// text variables (will not use)
portrait_index = 0; 
portrait = noone;
voice = snd_typewriter;
name = "";

// check frame for stopping walk animation
check_frame = true;

// radius for text
radius = 8;
active_textbox = noone;

// direction facing
facing = DIR.down;

// check to see when to freeze player sprite when they stop walking
steploop = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (!global.hu and !global.hd and !global.hl and !global.hr){
		image_index = 0;
	}
}, [], 1);

// change player speed only if player is moving
check_speed = time_source_create(time_source_game, 5, time_source_units_frames, function(){
if (global.hu or global.hd or global.hl or global.hr){
	if (spd = 2){
		image_speed = 1;
	} else {
		image_speed = 1.2;
	}
}
}, [], 1);

// state if player is able to move
state_free = function()
{
// only allow movement if these conditions are met (double-checking)
if (!instance_exists(obj_textbox) and global.do_transition == false and global.pause == false and can_move == true) {
// get the input direction from input
h_input = global.hr - global.hl;
v_input = global.hd - global.hu;

// if player is inputting
if (h_input != 0 or v_input != 0) {

// if you are checking the frame store the last frame before the current one
if (check_frame){
	framebefore = lastframe;
	image_index = lastframe;
	check_frame = false;
}

// if frame is not being checked check for sprite speed changes
if (check_frame = false){
	time_source_start(check_speed);
}

// change speed depending on input
if (global.hrun){
	spd = 3;
} else {
	spd = 2;
}

// If there is no input point player in a direction
if (h_input != 0 or v_input != 0){
	dir = point_direction(0,0,h_input,v_input);

	hsp = h_input*spd;
	vsp = v_input*spd;
} else if (h_input != 0 or v_input != 0) {
	dir = point_direction(0,0,h_input,v_input);

	hsp = h_input*spd;
	vsp = v_input*spd;
} 

// Interrupt movement when meeting a wall
if place_meeting(x + hsp, y, obj_wall)
{
	hsp = 0;
	if (vsp = 0) {
		image_speed = 0;
		image_index = 0;
	}
}
if place_meeting(x, y + vsp, obj_wall)
{
	vsp = 0;
	if (hsp = 0) {
		image_speed = 0;
		image_index = 0;
	}
}
if place_meeting(x + hsp, y, obj_par_roadblock)
{
	hsp = 0;
	if (vsp = 0) {
		image_speed = 0;
		image_index = 0;
	}
}
if place_meeting(x, y + vsp, obj_par_roadblock)
{
	vsp = 0;
	if (hsp = 0) {
		image_speed = 0;
		image_index = 0;
	}
} 

// play step sfx in player's house
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
#region
if (!global.has_backpack) {
	s_down = spr_player_walk;
	s_right = spr_player_rightwalk;
	s_left = spr_player_leftwalk;
	s_up = spr_player_upwalk;
}
else if (global.has_backpack and !global.has_coat){
	s_down = spr_player_walk_bag;
	s_right = spr_player_rightwalk_bag;
	s_left = spr_player_leftwalk_bag;
	s_up = spr_player_upwalk_bag;
}
else if (global.has_backpack and global.has_coat){
	s_down = spr_player_walk_coat;
	s_right = spr_player_rightwalk_coat;
	s_left = spr_player_leftwalk_coat;
	s_up = spr_player_upwalk_coat;
}

//Set Sprite depending on direction
switch(DIR){
	case 0: sprite_index = s_right; facing = DIR.right; break;
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
	case 270: sprite_index = s_down; facing = DIR.down break;
	case 315: 
	if (sprite_index = s_right /* or sprite_index = spr_player_leftwalk */){
	sprite_index = s_right; facing = DIR.right;
	}
	else if (sprite_index = s_down or sprite_index = s_up){
	sprite_index = s_down; facing = DIR.down;
	}
	break;
} 


#endregion
// set the last fram to 1 higher than the current frame
if (image_index != 3){
	lastframe = image_index+1;
} else {
	lastframe = 0;
}

	} else {
		// if player can move but isnt moving, but there's no input, end animation
		if (can_move = true){
				check_frame = true;
				image_speed = 0;
				if (!instance_exists(obj_textbox)){
					time_source_start(steploop);
				} else { image_index = 0; }
			}
		}
	} else {
		// if player can move but isnt moving, but there's no textbox or pausing etc., end animation
		if (can_move = true){
				check_frame = true;
				image_speed = 0;
				if (!instance_exists(obj_textbox)){
					time_source_start(steploop);
				} else { image_index = 0; }
			}
		}
}

// prevent movement options if in cutscene state
state_cutscene = function() {

}

// start at state_free
state = state_free;
