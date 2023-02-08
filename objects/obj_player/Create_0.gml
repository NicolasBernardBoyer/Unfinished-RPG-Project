hsp = 0;
vsp = 0;

s_down = spr_player_walk;
s_right = spr_player_rightwalk;
s_left = spr_player_leftwalk;
s_up = spr_player_upwalk;

canMove = true;
spd = 2;
sprite_index = spr_player_walk;
image_index = 0;
framebefore = 0;
lastframe = 0;
visible = false;

count = 0;

portrait_index = 0; 
portrait = noone;
voice = snd_typewriter;
name = "";
checkFrame = true;

radius = 8;
active_textbox = noone;

facing = 0;

stepLoop = time_source_create(time_source_game, 10, time_source_units_frames, function(){
	if (!keyboard_check(vk_up) and !keyboard_check(vk_down) and !keyboard_check(vk_left) and !keyboard_check(vk_right)){
		image_index = 0;
	}
}, [], 1);

checkSpeed = time_source_create(time_source_game, 5, time_source_units_frames, function(){
if (keyboard_check(vk_up or vk_down or vk_right or vk_left)){
	if (spd = 2){
		image_speed = 1;
	} else {
		image_speed = 1.2;
	}
}
}, [], 1);

stateFree = function()
{
	
// get the input direction from keys
hInput = keyboard_check(global.key_right) - keyboard_check(global.key_left);
vInput = keyboard_check(global.key_down) - keyboard_check(global.key_up);
gp_hInput = gamepad_button_check(0,global.gp_right) - gamepad_button_check(0,global.gp_left);
gp_vInput = gamepad_button_check(0,global.gp_down) - gamepad_button_check(0,global.gp_up);

if ((hInput != 0 or vInput != 0) or (gp_hInput != 0 or gp_vInput != 0)) {

if (checkFrame){
	framebefore = lastframe;
	image_index = lastframe;
	checkFrame = false;
}

if (checkFrame = false){
	time_source_start(checkSpeed);
}
	
if (keyboard_check(ord("X")) or gamepad_button_check(0,gp_shoulderrb) or gamepad_button_check(0,gp_shoulderlb)){
	spd = 3;
} else {
	spd = 2;
}

if ((hInput != 0 or vInput != 0) and (gp_hInput != 0 or gp_hInput != 0)){
	dir = point_direction(0,0,hInput,vInput);
	
	hsp = hInput*spd;
	vsp = vInput*spd;
} else if (hInput != 0 or vInput != 0) {
	dir = point_direction(0,0,hInput,vInput);

	hsp = hInput*spd;
	vsp = vInput*spd;
} else {
	dir = point_direction(0,0,gp_hInput,gp_vInput);

	hsp = gp_hInput*spd;
	vsp = gp_vInput*spd;
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

x += hsp;
y += vsp;


// This region is for setting the sprite depending on the state of the player
#region
if (!global.hasBackpack) {
	s_down = spr_player_walk;
	s_right = spr_player_rightwalk;
	s_left = spr_player_leftwalk;
	s_up = spr_player_upwalk;
}
else if (global.hasBackpack and !global.hasCoat){
	s_down = spr_player_walk_bag;
	s_right = spr_player_rightwalk_bag;
	s_left = spr_player_leftwalk_bag;
	s_up = spr_player_upwalk_bag;
}
else if (global.hasBackpack and global.hasCoat){
	s_down = spr_player_walk_coat;
	s_right = spr_player_rightwalk_coat;
	s_left = spr_player_leftwalk_coat;
	s_up = spr_player_upwalk_coat;
}

//Set Sprite
switch(dir){
	case 0: sprite_index = s_right; facing = dir.right; break;
	case 45: 
	if (sprite_index = s_right /*or sprite_index = spr_player_leftwalk*/){
	sprite_index = s_right; facing = dir.right;
	}
	else if (sprite_index = s_up or sprite_index = s_down){
	sprite_index = s_up; facing = dir.up;
	}
	break;
	case 90: sprite_index = s_up; facing = dir.up; break;
	case 135: 
	if (sprite_index = s_left /*or sprite_index = spr_player_rightwalk*/){
	sprite_index = s_left; facing = dir.left;
	}
	else if (sprite_index = s_up or sprite_index = s_down){
	sprite_index = s_up; facing = dir.up;
	}
	break;
	case 180: sprite_index = s_left; facing = dir.left; break;
	case 225: 
	if (sprite_index = s_left /*or sprite_index = spr_player_rightwalk*/){
	sprite_index = s_left; facing = dir.left;
	}
	else if (sprite_index = s_down  or sprite_index = s_up){
	sprite_index = s_down; facing = dir.down;
	}
	break;
	case 270: sprite_index = s_down; facing = dir.down break;
	case 315: 
	if (sprite_index = s_right /* or sprite_index = spr_player_leftwalk */){
	sprite_index = s_right; facing = dir.right;
	}
	else if (sprite_index = s_down or sprite_index = s_up){
	sprite_index = s_down; facing = dir.down;
	}
	break;
} 


#endregion
if (image_index != 3){
	lastframe = image_index+1;
} else {
	lastframe = 0;
}

	} else {
		if (canMove = true){
				checkFrame = true;
				image_speed = 0;
				if (!instance_exists(obj_textbox)){
					time_source_start(stepLoop);
				} else { image_index = 0; }
			}
		}
}

stateCutscene = function() {
	if (instance_exists(obj_textbox)){
			image_index = 0;
			image_speed = 0;
	}
}

stateTextbox = function() {
	image_index = 0;
	image_speed = 0;
}

state = stateFree;
