visible = false;
hasText = true;
fallEvent = false;
alarm[0] = -1;

voice = snd_typewriter;

name = "";
text = ["You didn't lock your bike, but it's ok.",
		"Nobody will steal it anyways."];
portrait_index = noone;
speakers = [id, id];
next_line = [0, 0];
scripts = [-1, -1];

alttext = ["You biked right into the rack and your bike inserted itself perfectly into it.",
			"You tried to get off the bike...",
			"However, you get off too fast. As you land on the ground, you lose your balance...",
			"..."];
altspeakers = [id, id, id, id];
altnext_line = [0, 0, -1, 0];
altscripts = [-1, -1, [player_fall_over], -1];

alttext2 = ["...You gotta stop doing that.",
			"..."];
altspeakers2 = [id, id];
altnext_line2 = [0, 0];
altscripts2 = [[canPauseTrue], -1];


