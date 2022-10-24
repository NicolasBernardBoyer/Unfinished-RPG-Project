if (room == rm_title_screen) {
	instance_deactivate_object(self);
}

if (!global.pause) {

// Textbox interaction
if (keyboard_check_pressed(global.key_confirm) or gamepad_button_check_pressed(0,global.gp_confirm)){
	if (!global.inventoryOpen and global.canPause = true){
		if(active_textbox == noone and !instance_exists(obj_textbox)){
			var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_object, false, true);
			if(inst != noone){
				if (inst.hasText = true){
					with(inst){
						var tbox = create_textbox(text, speakers, next_line, scripts);
					}
					active_textbox = tbox;
				}
			}
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
if (global.inventoryOpen == false and !instance_exists(obj_textbox) and obj_game.doTransition == false and global.pause == false and canMove == true) {

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
if (global.hasBackpack == false){
//Set Sprite
		switch(dir){
			case 0: sprite_index = spr_player_rightwalk; facing = dir.right; break;
			case 45: 
			if (sprite_index = spr_player_rightwalk /*or sprite_index = spr_player_leftwalk*/){
			sprite_index = spr_player_rightwalk; facing = dir.right;
			}
			else if (sprite_index = spr_player_upwalk or sprite_index = spr_player_walk){
			sprite_index = spr_player_upwalk; facing = dir.up;
			}
			break;
			case 90: sprite_index = spr_player_upwalk; facing = dir.up; break;
			case 135: 
			if (sprite_index = spr_player_leftwalk /*or sprite_index = spr_player_rightwalk*/){
			sprite_index = spr_player_leftwalk; facing = dir.left;
			}
			else if (sprite_index = spr_player_upwalk or sprite_index = spr_player_walk){
			sprite_index = spr_player_upwalk; facing = dir.up;
			}
			break;
			case 180: sprite_index = spr_player_leftwalk; facing = dir.left; break;
			case 225: 
			if (sprite_index = spr_player_leftwalk /*or sprite_index = spr_player_rightwalk*/){
			sprite_index = spr_player_leftwalk; facing = dir.left;
			}
			else if (sprite_index = spr_player_walk  or sprite_index = spr_player_upwalk){
			sprite_index = spr_player_walk; facing = dir.down;
			}
			break;
			case 270: sprite_index = spr_player_walk; facing = dir.down break;
			case 315: 
			if (sprite_index = spr_player_rightwalk /* or sprite_index = spr_player_leftwalk */){
			sprite_index = spr_player_rightwalk; facing = dir.right;
			}
			else if (sprite_index = spr_player_walk or sprite_index = spr_player_upwalk){
			sprite_index = spr_player_walk; facing = dir.down;
			}
			break;
		} 
		
} else if (global.hasBackpack and !global.hasCoat){
//Set Sprite with backpack
		switch(dir){
			case 0: sprite_index = spr_player_rightwalk_bag; facing = dir.right; break;
			case 45: 
			if (sprite_index = spr_player_rightwalk_bag /*or sprite_index = spr_player_leftwalk_bag*/){
			sprite_index = spr_player_rightwalk_bag; facing = dir.right;
			}
			else if (sprite_index = spr_player_upwalk_bag or sprite_index = spr_player_walk_bag){
			sprite_index = spr_player_upwalk_bag; facing = dir.up;
			}
			break;
			case 90: sprite_index = spr_player_upwalk_bag; facing = dir.up; break;
			case 135: 
			if (sprite_index = spr_player_leftwalk_bag /* or sprite_index = spr_player_rightwalk_bag */){
			sprite_index = spr_player_leftwalk_bag; facing = dir.left;
			}
			else if (sprite_index = spr_player_upwalk_bag or sprite_index = spr_player_walk_bag){
			sprite_index = spr_player_upwalk_bag; facing = dir.up;
			}
			break;
			case 180: sprite_index = spr_player_leftwalk_bag; facing = dir.left; break;
			case 225: 
			if (sprite_index = spr_player_leftwalk_bag /* or sprite_index = spr_player_rightwalk_bag */){
			sprite_index = spr_player_leftwalk_bag; facing = dir.left;
			}
			else if (sprite_index = spr_player_walk_bag  or sprite_index = spr_player_upwalk_bag){
			sprite_index = spr_player_walk_bag; facing = dir.down;
			}
			break;
			case 270: sprite_index = spr_player_walk_bag; facing = dir.down break;
			case 315: 
			if (sprite_index = spr_player_rightwalk_bag /* or sprite_index = spr_player_leftwalk_bag */){
			sprite_index = spr_player_rightwalk_bag; facing = dir.right;
			}
			else if (sprite_index = spr_player_walk_bag or sprite_index = spr_player_upwalk_bag){
			sprite_index = spr_player_walk_bag; facing = dir.down;
			}
			break;
	} 
} else if (global.hasBackpack and global.hasCoat){
//Set Sprite with backpack
		switch(dir){
			case 0: sprite_index = spr_player_rightwalk_coat; facing = dir.right; break;
			case 45: 
			if (sprite_index = spr_player_rightwalk_coat  /* or sprite_index = spr_player_leftwalk_coat */){
			sprite_index = spr_player_rightwalk_coat; facing = dir.right;
			}
			else if (sprite_index = spr_player_upwalk_coat or sprite_index = spr_player_walk_coat){
			sprite_index = spr_player_upwalk_coat; facing = dir.up;
			}
			break;
			case 90: sprite_index = spr_player_upwalk_coat; facing = dir.up; break;
			case 135: 
			if (sprite_index = spr_player_leftwalk_coat /* or sprite_index = spr_player_rightwalk_coat */){
			sprite_index = spr_player_leftwalk_coat; facing = dir.left;
			}
			else if (sprite_index = spr_player_upwalk_coat or sprite_index = spr_player_walk_coat){
			sprite_index = spr_player_upwalk_coat; facing = dir.up;
			}
			break;
			case 180: sprite_index = spr_player_leftwalk_coat; facing = dir.left; break;
			case 225: 
			if (sprite_index = spr_player_leftwalk_coat /*or sprite_index = spr_player_rightwalk_coat */){
			sprite_index = spr_player_leftwalk_coat; facing = dir.left;
			}
			else if (sprite_index = spr_player_walk_coat  or sprite_index = spr_player_upwalk_coat){
			sprite_index = spr_player_walk_coat; facing = dir.down;
			}
			break;
			case 270: sprite_index = spr_player_walk_coat; facing = dir.down break;
			case 315: 
			if (sprite_index = spr_player_rightwalk_coat /*or sprite_index = spr_player_leftwalk_coat*/){
			sprite_index = spr_player_rightwalk_coat; facing = dir.right;
			}
			else if (sprite_index = spr_player_walk_coat or sprite_index = spr_player_upwalk_coat){
			sprite_index = spr_player_walk_coat; facing = dir.down;
			}
			break;
	} 
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
