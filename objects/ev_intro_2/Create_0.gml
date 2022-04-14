visible = false;

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "???";
text = [
		global.playerName + "... huh.",
		"That's a nice name.",
		"Well " + global.playerName + ", I hate to interrupt our conversation like this, but I gotta get up. It's a work day.",
		"I'll be trying this out again, and I hope that I won't be bothering you again. Unless you want me to, that is.",
		"Alrighty then, time to wake up.",
		"Toodles!",
		"Coincidentally, you also need to wake up to go to work.",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, obj_game, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0];
scripts = [-1, -1, -1,
		   -1, -1, -1, [goto_room], -1];