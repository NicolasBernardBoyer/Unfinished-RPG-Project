visible = false;

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		global.playerName + "... huh.",
		"No... you're not someone else. That's impossible.",
		"You're just a voice in my head. You're just me.",
		"I am " + global.playerName + ".",
		"Alright then, "+ global.playerName + ". If you're me...",
		"Then wake up, or you'll be late for work.",
		global.playerName + "...",
		"...That's me.",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id, id, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0, 0];
scripts = [-1, -1, -1, -1, -1,
		   -1, -1, [goto_room], -1];