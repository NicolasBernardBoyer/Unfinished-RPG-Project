visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";
text = [
		"If you wish to play a part in this game, you must agree to the following statement:",
		"''This is a work of fiction. Any resemblance to actual persons, living or dead, or actual events is purely coincidental.''",
		"Do you understand?",
		["Yes", "No"],
		"So you say you agree? You are a fool.",
		"That's right, no. So you've seen through my lie.",
		"''Coincidental''? What a bunch of nonsense.",
		"Fiction is ALWAYS tield to reality, whether you like it or not.",
		"People don't just come up with ideas out of the blue. They are inspired.",
		"Fiction is inspired by reality, and thus, without reality, it wouldn't exist.",
		"And thus, fiction IS reality.",
		"Try and escape as much as you can.\nThere's no running from reality.",
		"Your new low-end job?\nYour lowsy roomate?\nAll real.\nThere is no running from it.",
		"A world in which humans and beastmen cannot get along, and are permanently in tension?\nThat's also real.",
		"And you are... Who again?",
		"Please enter your name.\nUse backspace/X to delete.",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id, id, id, id,
			id, id, id, id, id,
			id];
next_line = [0, 0, 0, [4,5], 6, 
			 6, 0, 0, 0, 0,
			 0, 0, 0, 0, 0,
			 0];
scripts = [-1, -1, -1, -1, -1,
		   -1, -1, -1, -1, -1,
		   -1, -1, -1, -1, -1,
		   [create_name_creator],-1];