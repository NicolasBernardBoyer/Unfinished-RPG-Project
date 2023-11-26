// listen for audio at player position
audio_listener_position(x, y, 0);

// dont show player if on title screen
if (room == rm_title_screen) {
	instance_deactivate_object(self);
}

if (!global.pause) {

// Textbox interaction, create one if not a party member and interacting with an object
if (global.POK){
	if (global.can_pause = true and can_move = true){
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
				if (variable_struct_exists(interact, "has_text")){
					if (interact.has_text = true){
						with(interact){
							var tbox = create_textbox(text, speakers, next_line, scripts);
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

// handle transition when touching one
var insttrans = instance_place(x,y,obj_transition);
if (insttrans != noone) {
	if(!global.do_transition){
		with (obj_game){
			spawn_room = insttrans.targetRoom;
			spawn_x = insttrans.target_x;
			spawn_y = insttrans.target_y;
			global.do_transition = true;
		}
	}
}

// run state machine
state();

// handle states under certain conditions
if (global.pause == false and can_move == true) {	
	state = stateFree;
	} else {
		state = stateCutscene;
	}
}