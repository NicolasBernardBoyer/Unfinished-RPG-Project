global.name_text_col = c_gray;
cutProg = 0;
//Declare the curve for the falling animation
dropSpeed = 0;
curve = animcurve_get_channel(ac_pitFall,0);

// Dialogue choices for the cutscene
sorryChoice = false;
blameChoice = false;
deathChoice = false;

p = obj_player;

portrait_index = 1;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

// Declare textbox variables
text = ["We both could've been done with our days, you know.",
		["''Sorry, I shouldn't have done that.''","''This is your fault, too.''","''Oh my god! We're gonna die!''"],
		"It's... it's fine. I accept your apology. It was my fault, too.",
		 "Besides, there's no point in me getting mad at you right now.",
		 "It would be more productive of me to try and find us a way out this mess.",
		 "Way to avoid taking responsibility. I'm real proud of you.",
		 "Then again, I'm pretty much doing the exact same thing right now.",
		 "...Let's try and see if I can get us out of this mess.",
		 "Oh come on, don't be such a drama queen.",
		 "We're not gonna die.",
		 "All I need to do is find a way to get us out of this mess."
		 ];
speakers = [id,p,id,id,id,id,id,id,id,id,id];
next_line = [0,[2,5,8],0,0,-1,0,0,-1,0,0,-1];
scripts = [-1,[[change_variable, obj_textbox, "portrait_index", 9, obj_kat, "sprite_index", spr_kat_fall_lookright],
   [change_variable, obj_textbox, "portrait_index", 10, obj_kat, "sprite_index", spr_kat_fall_lookright],
   [change_variable, obj_textbox, "portrait_index", 13, obj_kat, "sprite_index", spr_kat_fall_lookright]],
   [port_swap, 0],
   [port_swap, 5],
   [change_variable, id, "cutProg", 4],
   [port_swap, 13],
   [port_swap, 12],
   [change_variable, id, "cutProg", 4],
   [port_swap, 10],
   -1,
   [change_variable, id, "cutProg", 4]];

text2 = ["Here, get closer to me."];
speakers2 =	[id];
next_line2 = [0];
scripts2 = [[change_variable, id, "cutProg", 6]];






