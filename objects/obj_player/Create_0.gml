// speed variables for walking
hsp = 0;
vsp = 0;

// reference variables for walk animations
s_DOWN = spr_player_walk;
s_RIGHT = spr_player_RIGHTwalk;
s_LEFT = spr_player_LEFTwalk;
s_UP = spr_player_UPwalk;

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
checkFrame = true;

// radius for text
radius = 8;
active_textbox = noone;

// DIRection facing
facing = 0;

// check to see when to freeze player sprite when they stop walking
stepLoop = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (!global.HU and !global.HD and !global.HL and !global.HR){
		image_index = 0;
	}
}, [], 1);

// change player speed only if player is moving
checkSpeed = time_source_create(time_source_game, 5, time_source_units_frames, function(){
if (global.HU or global.HD or global.HL or global.HR){
	if (spd = 2){
		image_speed = 1;
	} else {
		image_speed = 1.2;
	}
}
}, [], 1);

// state if player is able to move
stateFree = function()
{
// only allow movement if these conditions are met (double-checking)
if (!instance_exists(obj_textbox) and global.do_transition == false and global.pause == false and can_move == true) {
// get the input DIRection from input
hInput = global.HR - global.HL;
vInput = global.HD - global.HU;

// if player is inputting
if (hInput != 0 or vInput != 0) {

// if you are checking the frame store the last frame before the current one
if (checkFrame){
	framebefore = lastframe;
	image_index = lastframe;
	checkFrame = false;
}

// if frame is not being checked check for sprite speed changes
if (checkFrame = false){
	time_source_start(checkSpeed);
}

// change speed depending on input
if (global.HRUN){
	spd = 3;
} else {
	spd = 2;
}

// If there is no input point player in a DIRection
if (hInput != 0 or vInput != 0){
	DIR = point_DIRection(0,0,hInput,vInput);
	
	hsp = hInput*spd;
	vsp = vInput*spd;
} else if (hInput != 0 or vInput != 0) {
	DIR = point_DIRection(0,0,hInput,vInput);

	hsp = hInput*spd;
	vsp = vInput*spd;
} 

// InterrUPt movement when meeting a wall
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
if place_meeting(x + hsp, y, par_roadblock)
{
	hsp = 0;
	if (vsp = 0) {
		image_speed = 0;
		image_index = 0;
	}
}
if place_meeting(x, y + vsp, par_roadblock)
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
	s_DOWN = spr_player_walk;
	s_RIGHT = spr_player_RIGHTwalk;
	s_LEFT = spr_player_LEFTwalk;
	s_UP = spr_player_UPwalk;
}
else if (global.has_backpack and !global.has_coat){
	s_DOWN = spr_player_walk_bag;
	s_RIGHT = spr_player_RIGHTwalk_bag;
	s_LEFT = spr_player_LEFTwalk_bag;
	s_UP = spr_player_UPwalk_bag;
}
else if (global.has_backpack and global.has_coat){
	s_DOWN = spr_player_walk_coat;
	s_RIGHT = spr_player_rightwalk_coat;
	s_LEFT = spr_player_leftwalk_coat;
	s_UP = spr_player_upwalk_coat;
}

//Set Sprite depending on DIRection
switch(DIR){
	case 0: sprite_index = s_RIGHT; facing = DIR.RIGHT; break;
	case 45: 
	if (sprite_index = s_RIGHT /*or sprite_index = spr_player_LEFTwalk*/){
	sprite_index = s_RIGHT; facing = DIR.RIGHT;
	}
	else if (sprite_index = s_UP or sprite_index = s_DOWN){
	sprite_index = s_UP; facing = DIR.UP;
	}
	break;
	case 90: sprite_index = s_UP; facing = DIR.UP; break;
	case 135: 
	if (sprite_index = s_LEFT /*or sprite_index = spr_player_RIGHTwalk*/){
	sprite_index = s_LEFT; facing = DIR.LEFT;
	}
	else if (sprite_index = s_UP or sprite_index = s_DOWN){
	sprite_index = s_UP; facing = DIR.UP;
	}
	break;
	case 180: sprite_index = s_LEFT; facing = DIR.LEFT; break;
	case 225: 
	if (sprite_index = s_LEFT /*or sprite_index = spr_player_RIGHTwalk*/){
	sprite_index = s_LEFT; facing = DIR.LEFT;
	}
	else if (sprite_index = s_DOWN  or sprite_index = s_UP){
	sprite_index = s_DOWN; facing = DIR.DOWN;
	}
	break;
	case 270: sprite_index = s_DOWN; facing = DIR.DOWN break;
	case 315: 
	if (sprite_index = s_RIGHT /* or sprite_index = spr_player_LEFTwalk */){
	sprite_index = s_RIGHT; facing = DIR.RIGHT;
	}
	else if (sprite_index = s_DOWN or sprite_index = s_UP){
	sprite_index = s_DOWN; facing = DIR.DOWN;
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
				checkFrame = true;
				image_speed = 0;
				if (!instance_exists(obj_textbox)){
					time_source_start(stepLoop);
				} else { image_index = 0; }
			}
		}
	} else {
		// if player can move but isnt moving, but there's no textbox or pausing etc., end animation
		if (can_move = true){
				checkFrame = true;
				image_speed = 0;
				if (!instance_exists(obj_textbox)){
					time_source_start(stepLoop);
				} else { image_index = 0; }
			}
		}
}

// prevent movement options if in cutscene state
stateCutscene = function() {

}

// start at stateFree
state = stateFree;
