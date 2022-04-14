visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "???";
text = [
		"Hello?",
		"Is anyone there?",
		"Oh. My. God.",
		"It actually worked! I'm a genius! Hahahahaha!",
		"Oh, I'm sorry. I didn't mean to bother you.",
		"It's just that I've been messing with some magic mumbo jumbo as of late.",
		"Been trying to contact people in other dimensions through dreams and whatnot.",
		"You should be fine once you wake up though.",
		"...",
		"Hey... out of pure curiosity, what's your name?",
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