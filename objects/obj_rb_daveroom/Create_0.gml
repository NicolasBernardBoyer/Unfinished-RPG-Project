global.name_text_col = c_orange;

//initialization

portrait_index = 3;
portrait = spr_dave_faces;

voice = snd_typewriter;
name = "Dave";
text = ["Hey! Since when are you allowed to go into MY room?",
		"I never invade YOUR privacy, do I?",
		"If I were you, I wouldn't go in there unless I wanted to see unspeakable things...",
		"Luckily for me, I'm not you, so I go in there all the time!"];

speakers = [id,id,id,id];
next_line = [0,0,0,0];
scripts = [-1,-1,[port_swap, 0],[change_variable, obj_davecouch, "image_index", 1]];

radius_x = 24;
radius_y = 8;
run_once = false;