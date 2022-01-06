// Textbox interaction
if (keyboard_check_pressed(ord("Z"))){
	if(active_textbox == noone){
		var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_object, false, true);
		if(inst != noone){
			with(inst){
				var tbox = create_textbox(text, speakers, next_line, scripts);
			}
			active_textbox = tbox;
		}
	} 
} else {
	if(!instance_exists(active_textbox)){
		active_textbox = noone;
	}
}

//Objects
var insttrans = instance_place(x,y,obj_transition);
if (insttrans != noone) {
	with(obj_game){
		if(!doTransition){
			spawnRoom = insttrans.targetRoom;
			spawnX = insttrans.targetX;
			spawnY = insttrans.targetY;
			doTransition = true;
		}
	}
}

// Moving (only if there isn't a textbox and the inventory isn't open)
if (global.inventoryOpen == false and !instance_exists(obj_textbox) and obj_game.doTransition == false) {

// get the input direction from keys
hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);

if (keyboard_check(ord("X"))){
	spd = 2.5;
	image_speed = 1.5;
} else {
	spd = 1.5;
	image_speed = 1;
}

if (keyboard_check_pressed(ord("C"))){
	global.inventoryOpen = true;
	if (keyboard_check_pressed(ord("C"))){
		global.inventoryOpen = false;
	}
}

if (hInput != 0 or vInput != 0) {
	
if (keyboard_check_pressed(vk_right) or keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down)) {
	image_index = lastframe;
	framebefore = lastframe;
}

dir = point_direction(0,0,hInput,vInput);

hsp = hInput*spd;
vsp = vInput*spd;

// Interrupt movement when meeting a wall
if place_meeting(x + hsp, y, obj_wall)
{
	hsp = 0;
	if (vsp = 0) {
		image_index = 0;
	}
}
if place_meeting(x, y + vsp, obj_wall)
{
	vsp = 0;
	if (hsp = 0) {
		image_index = 0;
	}
}
if place_meeting(x + hsp, y, par_roadblock)
{
	hsp = 0;
	if (vsp = 0) {
		image_index = 0;
	}
}
if place_meeting(x, y + vsp, par_roadblock)
{
	vsp = 0;
	if (hsp = 0) {
		image_index = 0;
	}
} 

x += hsp;
y += vsp;

//Set Sprite
	switch(dir){
		case 0: sprite_index = spr_player_rightwalk; facing = dir.right; break;
		case 45: 
		if (sprite_index = spr_player_rightwalk or sprite_index = spr_player_leftwalk){
		sprite_index = spr_player_rightwalk; facing = dir.right;
		}
		else if (sprite_index = spr_player_upwalk or sprite_index = spr_player_walk){
		sprite_index = spr_player_upwalk; facing = dir.up;
		}
		break;
		case 90: sprite_index = spr_player_upwalk; facing = dir.up; break;
		case 135: 
		if (sprite_index = spr_player_leftwalk or sprite_index = spr_player_rightwalk){
		sprite_index = spr_player_leftwalk; facing = dir.left;
		}
		else if (sprite_index = spr_player_upwalk or sprite_index = spr_player_walk){
		sprite_index = spr_player_upwalk; facing = dir.up;
		}
		break;
		case 180: sprite_index = spr_player_leftwalk; facing = dir.left; break;
		case 225: 
		if (sprite_index = spr_player_leftwalk or sprite_index = spr_player_rightwalk){
		sprite_index = spr_player_leftwalk; facing = dir.left;
		}
		else if (sprite_index = spr_player_walk  or sprite_index = spr_player_upwalk){
		sprite_index = spr_player_walk; facing = dir.down;
		}
		break;
		case 270: sprite_index = spr_player_walk; facing = dir.down break;
		case 315: 
		if (sprite_index = spr_player_rightwalk or sprite_index = spr_player_leftwalk){
		sprite_index = spr_player_rightwalk; facing = dir.right;
		}
		else if (sprite_index = spr_player_walk or sprite_index = spr_player_upwalk){
		sprite_index = spr_player_walk; facing = dir.down;
		}
		break;
	} 
lastframe = image_index;


if (framebefore == lastframe){
	if (lastframe = 3) {
		lastframe = 0;
	} else {
	lastframe += 1;
	}
}

} else {
	image_index = 0;
	}
} else {
	image_index = 0;
}

