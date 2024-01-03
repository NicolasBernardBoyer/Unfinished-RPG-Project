// time source initialization
textbox_delay = time_source_create(time_source_game, 60, time_source_units_frames, function()
	{
		if (move_cam = true and !instance_exists(obj_textbox)){
			portrait_index = 13;
			create_textbox(text2, speakers2, next_line2, scripts2);
			move_cam = false;
		}
		time_source_stop(textbox_delay);
	}, [], -1);
	
	kat_react = time_source_create(time_source_game, 90, time_source_units_frames, function()
		{
			if (sprite_index != spr_kat_bendover_lookright and cut_prog = 0){
				sprite_index = spr_kat_bendover_lookright;
				instance_create_layer(x, y-55,"Text", obj_exclamation);
				if (cut_prog = 0){
					cut_prog++;
				}		
			}
		time_source_stop(kat_react);
		}, [], -1);

// reactivate player object
instance_activate_object(obj_player);
// make it so that our objects higher on the y axis are drawn first
visible = false;

// cutscene variables
move_forward = true;
move_cam = false;
crater_textbox = false;
run_choice = false;
stare_choice = false;
run_once = true;
run_once2 = true;

cut_prog = 0;

has_text = false;
portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";
text = ["Well, I guess it's just me.",
		"That's not a crater, it's just a massive hole.",
		"How the hell did this get here?"];
speakers = [id,id,id];
next_line = [0,0,-1];
scripts = [-1,
[change_variable, obj_textbox, "portrait_index", 16],
[change_variable, id, "move_cam", true]];

text2 = ["Sheesh. This thing is so deep, I can't even see the bottom.",
		"I wonder how far down it goes..."];
speakers2 = [id,id];
next_line2 = [0,-1];
scripts2 = [-1,
[change_variable, id, "run_choice", true]];

// use different speaker here for no textbox
text3 = ["The mystery behind the hole reels you in, causing you to want to look closer."];
speakers3 = [obj_player,obj_player];
next_line3 = [-1];
scripts3 = [[change_variable, id, "stare_choice", true]];

// have the cliff continue the cutscene
text4 = ["W-WAIT! DON'T STAND THERE, YOU IDIOT!"];
speakers4 = [id];
next_line4 = [-1];
scripts4 = [[change_variable, obj_cliff_park, "cliff_break", true]];