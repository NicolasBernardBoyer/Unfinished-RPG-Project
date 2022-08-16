visible = false;
goToPark = false;
katBox = false;

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"After a long shift with no customers and cold weather, the manager comes and picks up the truck.",
		"As the manager said, Katarina was not the most social person, barely saying a word during the shift unless a question was asked.",
		"Despite her not being interested in conversation, you walked together on the way home.",
		"..."
		];
speakers = [id, id, id, id];
next_line = [0, 0, -1, 0];
scripts = [-1,-1,[change_variable, id, "katBox", true],-1];

portrait_index = 7;
portrait = spr_kat_faces;
kattext = ["Hey... Is it just me, or is there a massive crater in the middle of the park?",
			"..."
			];
katspeakers = [id,id];
katnext_line = [-1,0];
katscripts = 
[[change_variable, id, "goToPark", true], -1
];
