// make it so that our objects higher on the y axis are drawn first
visible = false;
has_text = true;

voice = snd_typewriter;
name = "";
text = [
		"It's my backpack. I'm gonna need this for work.",
		"Take it?",
		["Yes","No"],
		"I picked up the backpack. press C to open your inventory.",
		"I decided to not take the backpack."
		];
portrait_index = noone;
speakers = [id, id, id, id, id, id];
next_line = [0, 0, [3,4], -1, -1];
scripts = [-1,-1,[[backpack_pickup], -1] ,-1,-1];