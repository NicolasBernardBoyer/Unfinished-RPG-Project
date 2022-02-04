visible = false;

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"Ugh.",
		"I can feel it.",
		"It's almost time.",
		"It's almost time for me to wake up.",
		"Today is another day. Except it isn't.",
		"People can say whatever they want. Every day is the same.",
		"In that case, why even bother?",
		"Moving out was the worst decision I've ever made.",
		"Thanks to my stupid head and it's stupid decisions, I'm stuck in this craphole with this smelly bastard of a roommate.",
		"I have no friends, no future, no anticipations. Nothing.  I'm so... useless.",
		"I'm just a waste of life. If only someone else could take it from me.",
		"That person could maybe make a change in this awful world plagued by injustice.",
		"That person could maybe change others for the better and make them happier.",
		"But that person isn't me.",
		"...",
		"You. I can sense you. Don't you go thinking I don't know you're there.",
		"Who are you?",
		"Please enter your name.",
		"...",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id, id, id, id,
			id, id, id, id, id,
			id, id, id, id, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0, 0, 0,
			 0, 0, 0, 0, 0,
			 0, 0, 0, 0, 0];
scripts = [-1, -1, -1, -1, -1, 
		   -1, -1, -1, -1, -1, 
		   -1, -1, -1, -1, -1, 
		   -1, [create_name_creator], -1];