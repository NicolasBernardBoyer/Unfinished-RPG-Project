// initialized variables
visible = false;
goToPark = false;

kat = obj_kat;
p = obj_player;
alarm[0] = -1;

destroyKat = false;
portrait_index = 10;
portrait = noone;

name = "";
voice = snd_typewriter;
text = [
		"After a long shift with no customers and cold weather, the manager comes and picks up the truck.",
		"You and your coworker decide to walk to the parking lot together before parting ways.",
		"Well, I would ask you if you enjoyed your first day, but this is a fast food job.",
		"You did alright, I'd give you a 7/10. Better than most of the others I've had to train.",
		"Hey... Is it just me, or is there a massive crater in the middle of the park?"
		];
speakers = [id,id,kat,kat,kat];
next_line = [0,0,0,0,0];
scripts = [-1,[port_swap, 10],
[port_swap, 5],
[port_swap, 7],
[change_variable, id, "goToPark", true, id, "destroyKat", true]];

