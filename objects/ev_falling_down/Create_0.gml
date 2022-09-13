global.name_text_col = c_gray;
cutProg = 0;
dropSpeed = 0;
curve = animcurve_get_channel(ac_pitFall,0);

sorryChoice = false;
blameChoice = false;
deathChoice = false;

portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

text = ["Well, this is just great.",
		"We both could've been done with our days, you know.",
		"But instead, you had to walk onto the same cliff as me,",
		"and because of THAT, we're now gonna be stuck underground with no way out!"];
speakers = [id,id,id,id];
next_line = [0,0,0,-1];
scripts = [[change_variable, id, "portrait_index", 1],[change_variable, id, "portrait_index", 1],[change_variable, id, "portrait_index", 2],[change_variable, id, "cutProg", 2]];

text2 = [["   ''Sorry, I shouldn't have done that.''","   ''This is your fault, too.''","   ''Oh my god! We're gonna die!''"]];
speakers2 = [obj_player];
next_line2 = [[-1,-1,-1]];
scripts2 = [[[change_variable, id, "sorryChoice", true],[change_variable, id, "blameChoice", true],[change_variable, id, "deathChoice", true]]];

text3 = ["It's... it's fine. I accept your apology. It was my fault, too.",
		 "Besides, there's no point in me getting mad at you right now.",
		 "It would be more productive of me to try and find us a way out this mess."];
speakers3 =	[id,id,id];
next_line3 = [0,0,-1];
scripts3 = [[change_variable, id, "portrait_index", 0], [change_variable, id, "portrait_index", 5], [change_variable, id, "cutProg", 4]];

text4 = ["Way to avoid taking responsibility. I'm real proud of you.",
		 "Then again, I'm pretty much doing the exact same thing right now.",
		 "...Let's try and see if I can get us out of this mess."];
speakers4 = [id,id,id];
next_line4 = [0,0,0];
scripts4 = [[change_variable, id, "portrait_index", 13], [change_variable, id, "portrait_index", 12], [change_variable, id, "cutProg", 4]];

text5 = ["Oh come on, don't be such a drama queen.",
		 "We're not gonna die.",
		 "All I need to do is find a way to get us out of this mess."];
speakers5 =	[id,id,id];
next_line5 = [0,0,-1];
scripts5 = [[change_variable, id, "portrait_index", 10],-1, [change_variable, id, "cutProg", 4]];

text6 = ["Here, get closer to me."];
speakers6 =	[id];
next_line6 = [0];
scripts6 = [[change_variable, id, "cutProg", 6]];





