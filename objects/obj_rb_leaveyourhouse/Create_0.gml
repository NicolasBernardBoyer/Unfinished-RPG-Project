
text_col = c_white;
portrait = noone;
voice = snd_typewriter;
name = "";
text = ["Head out to work?", 
	   ["Yes", "No"],
	   "Hurry up!",
	   "Hey " + global.player_name + ", be careful.\nIt's a wild world out there.",
	   ];
portrait_index = 0;
speakers = [id,id,id,obj_davecouch,obj_davecouch];
next_line = [0,[3,0],-1,0,0];
scripts = [-1,[-1,[change_variable, id, "moveplayer", true]],-1,[leave_house]];

radius_x = 8;
radius_y = 32;
run_once = false;

alarm[0] = -1;
moveplayer = false;
instance_deactivate_object(self);