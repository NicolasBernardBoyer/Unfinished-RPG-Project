
kat = obj_kat;

portrait = noone;
portrait_index = 11;
voice = snd_typewriter;
name = "";
name_col = c_white;
kat_approach = false;

text = ["Oh shit.",
		"I've seen this emblem somewhere before.",
		["''What does it mean?''", "''Oh shit?''"],
		"It belongs to this pharmaceutical company that's been a joke recently.",
		"Oh... it's nothing, just some company I've heard bad rumors about.",
		"It's called ''Wolfred Entreprises'', or something like that.",
		"Lately they've been advertising this new drug that gives you magic powers.",
		"Kinda like steroids, but you just become magically strong.",
		"Who would even purchase a drug that claims it would give you magic powers?",
		["''I would, for sure.''", "''Maybe you?''", "''Losers with no life.''"],
		"I guess the power is tempting. You'd be the prime target for a scam like this.",
		"Me? I wouldn't believe in stupid scams like this.",
		"My thoughts exactly. You can only learn magic through practice.",
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
		   [port_swap, 15],[port_swap, 15],[port_swap, 15],[port_swap, 0],[change_variable, id, "kat_approach", true]];


