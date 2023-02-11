audio_listener_position(x, y, 0);

if (room == rm_title_screen) {
	instance_deactivate_object(self);
}

if (!global.pause) {

// Textbox interaction
if (keyboard_check_pressed(global.key_confirm) or gamepad_button_check_pressed(0,global.gp_confirm)){
	if (!global.inventoryOpen and global.canPause = true and canMove = true){
		if(active_textbox == noone and !instance_exists(obj_textbox)){
			var inst_list = ds_list_create();
			var inst = collision_rectangle_list(x-radius, y-radius, x+radius, y+radius, par_object, false, true, inst_list, true);
			var interact = noone;
			if inst > 0 {
				for (var i = 0; i < inst; ++i;){
					if (inst_list[| i] != obj_kat){
						interact = inst_list[| i];
					}
				}
			}
			if(interact != noone){
				if (variable_struct_exists(interact, "hasText")){
					if (interact.hasText = true){
						with(interact){
							if (!variable_instance_exists(interact, "portrait")){
								var tbox = create_textbox(text, speakers, next_line, scripts);
							} else {
								if (portrait != noone){
									var tbox = create_facetextbox(text, speakers, next_line, scripts);
								} else {
									var tbox = create_textbox(text, speakers, next_line, scripts);
								}
							}
						}
						active_textbox = tbox;
					}
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

state();

if (global.inventoryOpen == false and global.pause == false and canMove == true) {	
	state = stateFree;
	} else {
		state = stateCutscene;
	}
}