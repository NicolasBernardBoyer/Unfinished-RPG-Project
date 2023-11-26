visible = false;
has_text = true;

voice = snd_typewriter;
name = "";

text = [
		"Should I take my coat from the coatrack?",
		["Yes","No"],
		"I put my coat on.",
		"I'm now ready for work. I should go ahead and head out the front door.",
		"I decided to take the coat some other time."
];

portrait_index = noone;
speakers = [id, id, id, id, id, id];
next_line = [0, [2,4], 0, -1,-1];
scripts = [-1,[[coat_pickup], -1],-1,-1,-1];
