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

// DIRection facing
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


// start at state_free
state = state_idle;
