// Time source initialization
	// Delayed staff pull animation
staffAnim = false;
	
staffPull = time_source_create(time_source_game, 40, time_source_units_frames, function(){
	staffAnim = true;
}, [], 1);

approachTextbox = time_source_create(time_source_game, 45, time_source_units_frames, function(){
	if (!instance_exists(obj_textbox) and cutProg = 3){
		obj_kat.portrait_index = 0;
		create_textbox(text2,speakers2,next_line2,scripts2);
	}
}, [], 1);

runOnce = true;

global.name_text_col = c_gray;
cutProg = 0;
//Declare the curve for the falling animation
dropSpeed = 0;
curve = animcurve_get_channel(ac_pitFall,0);

p = obj_player;
kat = obj_kat;

portrait_index = 10;
portrait = noone;
voice = snd_typewriter;
name = "";

// Declare textbox variables
text = ["I guess I'm gonna have to call mom and tell her I'm gonna be late.",
		"Oh, don't worry about breaking both of your legs and dying.",
		"Neither of those things are going to happen.",
		 ];
speakers = [kat,kat,kat];
next_line = [0,0,0];
scripts = [[change_variable, obj_kat, "sprite_index", spr_kat_fall_lookright, obj_textbox, "portrait_index", 7],
   [port_swap,3],
   [change_variable, id, "cutProg", 2]];

// initialization for dialogue in the 2nd part of the cutscene
text2 = ["Here, get closer to me."];
speakers2 =	[kat];
next_line2 = [0];
scripts2 = [[change_variable, id, "cutProg", 4]];






