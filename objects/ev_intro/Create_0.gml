visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"I can feel it.",
		"It's almost time for me to wake up.",
		"Today is another day.",
		"...",
		"I don't wanna get up. I don't see the point.",
		"Moving out was the worst decision I've ever made.",
		"Thanks to my stupid decisions, I'm stuck in this garbage apartment with this smelly loser.",
		"It's all my fault.",
		"If only someone else could make use of my life.",
		"That person could maybe make a change in this awful world.",
		"That person could maybe change others for the better.",
		"But that person isn't me.",
		"...",
		"I can sense someone listening. Don't you go thinking I don't know you're there.",
		"Who are you?",
		"Please enter your name.",
		"...",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id, id, id,
			id, id, id, id, id,
			id, id, id, id, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0, 0,
			 0, 0, 0, 0, 0,
			 0, 0, 0, 0, 0];
scripts = [-1, -1, -1, -1, -1, 
		   -1, -1, -1, -1, 
		   -1, -1, -1, -1, -1, 
		   -1, [create_name_creator], -1];