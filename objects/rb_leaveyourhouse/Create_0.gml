
text_col = c_white;
portrait = noone;
voice = snd_typewriter;
name = "";
text = ["Head out to work?", 
	   ["Yes", "No"],
	   "Hurry up!",
	   "Hey " + global.playerName + ", be careful.\nIt's a wild world out there.",
	   ];
portrait_index = 0;
speakers = [id,id,id,obj_davecouch,obj_davecouch];
next_line = [0,[3,0],-1,0,0];
scripts = [-1,[-1,[change_variable, id, "movePlayer", true]],-1,[leave_house]];

radiusX = 8;
radiusY = 32;
runOnce = false;

alarm[0] = -1;
movePlayer = false;
instance_deactivate_object(self);