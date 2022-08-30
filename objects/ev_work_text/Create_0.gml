visible = false;
goToPark = false;
katBox = false;

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"After a long shift with no customers and cold weather, the manager comes and picks up the truck.",
		"You and your coworker decide to walk to the parking lot together before parting ways.",
		"..."
		];
speakers = [id, id, id];
next_line = [0, -1, 0];
scripts = [-1,[change_variable, id, "katBox", true],-1];

portrait_index = 10;
portrait = spr_kat_faces;
kattext = ["Well, I would ask you if you enjoyed your first day, but this is a fast food job.",
		    "You did alright, I'd give you a 7/10. Better than most of the others I've had to train.",
			"Hey... Is it just me, or is there a massive crater in the middle of the park?",
			"..."
			];
katspeakers = [id,id,id,id];
katnext_line = [0,0,-1,0];
katscripts = 
[[change_variable, id, "portrait_index", 5],[change_variable, id, "portrait_index", 7],[change_variable, id, "goToPark", true], -1
];
