
kat = obj_kat;

portrait = noone;
portrait_index = 11;
voice = snd_typewriter;
name = "";
katApproach = false;

text = ["Oh no.",
		"I've seen this emblem before.",
		["''What does it mean?''", "''Oh no?''"],
		"It belongs to a company that sells magic-related substances.",
		"Oh... it's nothing, just some company I've heard bad rumors about.",
		"It's called ''Wolfred Entreprises'', or something like that.",
		"As far as I know, most people think that their products are a scam.",
		"Mostly because they say that their products will give you magic powers.",
		"Who would even purchase a product that claims it would give you magic powers?",
		["''I would, for sure.''", "''Maybe you?''", "''Losers with no life.''"],
		"I guess the power is tempting, but I think enhancements are phoney.",
		"Me? I don't believe in artificial ways to gain magic powers.",
		"My thoughts exactly. You can only learn magic through hard work.",
		"The only effective way to be able to do magic is to actually study witchcraft.",
		"Anyways, enough about this topic. Let's press on."];
speakers = [kat, kat, kat,
			kat, kat, kat, kat, kat, kat, kat,
			kat, kat, kat, kat, kat];
next_line = [0,0,[3,4],
			 5,5,0,0,0,0,[10,11,12],
			 13,13,13,0,0,0];
scripts = [-1,-1,[[port_swap, 0],[port_swap, 13]],
		   [port_swap, 0],[port_swap, 0],[port_swap, 10],-1,-1,-1,[[port_swap, 13],[port_swap, 16],[port_swap, 10]],
		   [port_swap, 15],[port_swap, 15],[port_swap, 15],[port_swap, 0],[change_variable, id, "katApproach", true]];


