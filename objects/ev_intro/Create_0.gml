visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_meow;
name = "???";
text = [
		"Hello?",
		"Is anyone there?",
		"Oh. My. God.",
		"It actually worked! I'm a genius!",
		"Oh, I'm sorry. I didn't mean to bother you.",
		"I've just been messing with dream magic lately, and I guess I came across you.",
		"You should be fine once you wake up though.",
		"...",
		"Well, this is awkward. My explanation must sound really weird. Why don't we change the subject?",
		"Why don't you tell me your name?",
		"Please enter your name.",
		"...",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id, id, id,
			id, id, id, id, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0, 0,
			 0, 0, 0, 0, 0];
scripts = [-1, -1, -1, -1, -1, 
		   -1, -1, -1, -1, 
		   -1, [create_name_creator], -1];