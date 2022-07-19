visible = false;
deactivatePlayer = true;
goToPark = false;

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"After a long shift with no customers and cold weather, the manager comes and picks up the truck.",
		"As the manager said, Katarina was not the most social person, barely saying a word during the shift unless a question was asked.",
		"Despite her not being interested in conversation, you walked together on the way home.",
		"..."
		];
portrait_index = noone;
speakers = [id, id, id, id];
next_line = [0, 0, -1, 0];
scripts = [-1,-1,[change_variable, id, "goToPark", true],-1];
