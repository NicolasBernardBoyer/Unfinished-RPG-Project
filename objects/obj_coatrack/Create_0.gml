visible = false;
hasText = true;

voice = snd_typewriter;
name = "";

text = [
		"Take your coat from the coatrack?",
		["    Yes","    No"],
		"You put your coat on.",
		"You're now ready for work. Go ahead and head out the front door.",
		"You decided to take the coat some other time."
		];

portrait_index = noone;
speakers = [id, id, id, id, id, id];
next_line = [0, [2,4], 0, -1,-1];
scripts = [-1,[[coat_pickup], -1],-1,-1,-1];
