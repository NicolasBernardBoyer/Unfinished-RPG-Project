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

portrait_index = 1;
portrait = noone;
voice = snd_typewriter;
name = "";

// Declare textbox variables
text = ["We both could've been done with our days, you know.",
		["''Sorry, I shouldn't have done that.''","''This is your fault, too.''","''Oh my god! We're gonna die!''"],
		"Yeah. You shouldn't have.",
		 "Now I gotta save both of our asses.",
		 "Way to avoid taking responsibility. I'm real proud of you.",
		 "Despite this being ALL your fault, I'll be the one saving both of us.",
		 "What an unfair world we live in.",
		 "Oh come on, don't be such a drama queen.",
		 "We're not gonna die. At least not from fall damage.",
		 "I can easily get us out of this."
		 ];
speakers = [kat,kat,kat,kat,kat,kat,kat,kat,kat,kat,kat];
next_line = [0,[2,4,7],0,-1,0,0,-1,0,0,-1];
scripts = [-1,[[change_variable, obj_textbox, "portrait_index", 1, obj_kat, "sprite_index", spr_kat_fall_lookright],
   [change_variable, obj_textbox, "portrait_index", 10, obj_kat, "sprite_index", spr_kat_fall_lookright],
   [change_variable, obj_textbox, "portrait_index", 9, obj_kat, "sprite_index", spr_kat_fall_lookright]],
   [port_swap, 1],
   [change_variable, id, "cutProg", 2],
   [port_swap, 10],
   [port_swap, 13],
   [change_variable, id, "cutProg", 2],
   [port_swap, 10],
   -1,
   [change_variable, id, "cutProg", 2]];

// initialization for dialogue in the 2nd part of the cutscene
text2 = ["Here, get closer to me."];
speakers2 =	[kat];
next_line2 = [0];
scripts2 = [[change_variable, id, "cutProg", 4]];






