
kat = obj_kat;

portrait = spr_kat_faces;
portrait_index = 3;
voice = snd_typewriter;
name = "";
text = ["See that thing on the ground? You should probably take it with you.",
		"We don't know when we might run into trouble.",
		"I'm not saying that we're in grave danger, but better safe than sorry, RIGHT?",
		"WE'RE DOOMED! WE SHALL MEET OUR DEATH IN THIS PIT!! MWHAHAHAHAHA!",
		"...sorry, that wasn't really funny.",
		"Just take the weapon.",
		"It has a special ability that makes things less awkward by ending this conversation."];
speakers = [kat, kat, kat, kat, kat, kat, kat];
next_line = [0,0,0,0,0,0,0];
scripts = [[port_swap,0],[port_swap,12],[port_swap,17],[port_swap,12],
		   [port_swap,9],[port_swap, 5],[destroy_obj, self]];


