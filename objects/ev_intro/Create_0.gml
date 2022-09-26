visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";
text = [
		"Greetings.",
		"It has been a while.",
		"If you don't remember, that is fine. \nI'll give you a little reminder.",
		"I am your conscience.\nWe haven't had a talk in quite a while.",
		"People are often so busy with their lives that they simply go through the motions without taking a moment to stop and reflect...",
		"But since we've been apart for quite some time, I'd like you to remind me what name you go by.",
		"Please enter your name.\nUse backspace/X to delete.",
		];
portrait_index = noone;
speakers = [id, id, id, id, id,
			id, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0];
scripts = [-1, -1, -1, -1, -1, 
		   [create_name_creator], -1];