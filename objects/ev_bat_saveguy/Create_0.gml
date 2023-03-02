
kat = obj_kat;
sguy = obj_save_guy;
cutProg = -1;

portrait = noone;
portrait_index = 3;
voice = snd_typewriter;
name = "";
name_col = c_white;
text = ["OH MY GOD! WHAT IS THAT?!?!?!?"];
speakers = [kat];
next_line = [0];
scripts = [[change_variable, id, "cutProg", 1]];

text2 = ["EEK! IS THAT A NAKED GUY?!? OH MY GOD!",
		 "Ugh, stop screamin'. you're givin' me a headache.",
		 "I'm NOT naked, I'm just wearing white clothes.",
		 "Man, people gettin' offended by anythin' nowadays.",
		 "Ok, so you're not naked. Who the hell are you, and what are you doing here?",
		 "Can you not read the sign? I'm Save Guy.",
		 "There's no way in hell that that's your actual name.",
		 "I ain't lyin'. Name's Save Guy.",
		 "This area is off-limits, don't ya know? I dunno what y'all are doin' here.",
		 "Wait, do you work for that company?",
		 "No. My job is workin' as a save guy for the city.",
		 "Anyways, both of ya should go back the way ya came.",
		 "We fell down a hole. We can't go back the same way we went in.",
		 "Well then, there is another exit, but it won't be easy to get there.",
		 "You'll have to fight the employees. Want me to teach ya the ropes?",
		 "Thanks, but I can defend myself just fine.",
		 "What about your friend here? Can they fight?",
		 "Oh... I'm not so sure. You don't have a weapon, do you " + global.playerName + "?",
		 "I can provide you with some wares, granted that you'll listen to my tutorial.",
		 "Will you participate in Save Guy's tutorial?",
		 ["Yes", "Yes"],
		 "You decided out of your own free will to participate.",
		 "Here, I'll give you this. You seem like the type to be good at swingin'.",
		 ];
speakers2 = [kat,sguy,sguy,sguy,
			 kat,sguy,kat,sguy,
			 sguy,kat,sguy,sguy,
			 kat, sguy,sguy,kat,
			 sguy,kat,sguy,id,
			 id,id,sguy,sguy];
next_line2 = [0,0,0,0,
			  0,0,0,0,
			  0,0,0,0,
			  0,0,0,0,
			  0,0,0,0,
			 [0,0],0,0];
scripts2 = [[port_swap, 0], [port_swap, 0], [port_swap, 0], [port_swap, 1],
			[port_swap, 0], [port_swap, 1], [port_swap, 0], [port_swap, 0],
			[port_swap, 16], [port_swap, 0], [port_swap, 0], [port_swap, 10],
			[port_swap, 0], [port_swap, 0], [port_swap, 10], [port_swap, 0],
			[port_swap, 7], [port_swap, 0], -1, -1,
			[-1, -1], [port_swap, 0], [change_variable, id, "cutProg", 2]];
			
text3 = ["So, about your job...",
		 "What exactly does being a save guy entail?",
		 "It's quite simple, actually. I save for people.",
		 "I'm not sure I understand.",
		 "It's a lot easier to grasp with a demonstration.",
		 "...but you don't really have anythin' to save.",
		 "Once my tutorial is done, then I can save for you.",
		 "Alright, time to beat the shit outta you! ...In an educational way!",
		 "It's savin' time!"];
speakers3 = [kat, kat, sguy, kat, sguy, sguy, sguy, sguy, sguy];
next_line3 = [0,0,0,0,0,0,0,0,0];
scripts3 = [[port_swap, 0], [port_swap, 0], [port_swap, 0],[port_swap, 0],
			[port_swap, 0], [port_swap, 0], [port_swap, 0],[port_swap, 0],
			[port_swap, 0], [port_swap, 0], [port_swap, 0],[port_swap, 0]];


