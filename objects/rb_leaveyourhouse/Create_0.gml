portrait = spr_dave_faces;
davePart = false;

voice = snd_typewriter;
name = "";
text = ["Head out to work?", 
	   ["Yes", "No"],
	   "Hurry up!"];
portrait_index = 0;
speakers = [id,id,id,id];
next_line = [0,[-1,0],0];
scripts = [-1,[[change_variable, id, "davePart", true],-1],-1];

davetext = ["Hey " + global.playerName + ", be careful.\nIt's a wild world out there.",
			"Get it? Wild?\nBecause beastmen exist?\nOkay, I'll let you leave."];
davespeakers = [id,id];
davenext_line = [0,0];
davescripts = [[change_variable, obj_textbox, "portrait_index", 2],[leave_house]];

radiusX = 8;
radiusY = 36;
runOnce = false;