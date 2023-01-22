text_col = c_white;
portrait = noone;
voice = snd_typewriter;
name = "";
text = ["Head out to work?", 
	   ["Yes", "No"],
	   "Hurry up!",
	   "Hey " + global.playerName + ", be careful.\nIt's a wild world out there.",
		"Get it? Wild?\nBecause animals exist?\nOkay, I'll let you leave."
	   ];
portrait_index = 0;
speakers = [id,id,id,obj_davecouch,obj_davecouch];
next_line = [0,[3,0],-1,0,0];
scripts = [-1,[-1,-1],-1,
			[change_variable, obj_textbox, "portrait_index", 2],[leave_house]];

radiusX = 8;
radiusY = 36;
runOnce = false;