
kat = obj_kat;
sguy = obj_save_guy;
cutProg = 0;

portrait = noone;
portrait_index = 3;
voice = snd_typewriter;
name = "";
text = ["OH MY GOD! WHAT IS THAT?!?!?!?"];
speakers = [kat];
next_line = [0];
scripts = [[change_variable, id, "cutProg", 1]];

text2 = ["EEK! IS THAT A NAKED GUY?!? OH MY GOD!",
		 "Ugh, stop screamin'. you're givin' me a headache.",
		 "I'm NOT naked, I'm just wearing white clothes.",
		 "Man, people gettin' offended by anythin' nowadays.",
		 "Awesome, you're not naked. Who are YOU, anyways?",
		 "Can you not read the sign? I'm Save Guy.",
		 "There's no shot that's your actual name.",
		 "I ain't lyin'. I'm just Save Guy, that's all there is to it.",
		 "What are you two even doin' down here? This area is off-limits, you know.",
		 "Oh? Are you an employee of Wolfred Entreprises?",
		 "No. My job is workin' as a save guy for the city.",
		 "Both of you should go back the way you came. It ain't safe past here.",
		 "We fell down a hole. We can't go back the same way we went in.",
		 "Well then, you'll need to be able to fight your way out.",
		 "Want me to teach you the ropes? I'm great at teachin'!",
		 "Thanks, but I can defend myself just fine.",
		 "What about your friend here?",
		 "Oh yeah, that's right. You don't have a weapon, do you " + global.playerName + "?",
		 "I can provide you with some wares, granted that you'll listen to my tutorial.",
		 "Will you participate in Save Guy's tutorial?",
		 ["Yes", "Yes"],
		 "You decided out of your own free will to participate.",
		 "Here, I'll give you this. You seem like the type to be good a swingin'.",
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
			[port_swap, 0], [port_swap, 18], [port_swap, 0], [port_swap, 0],
			[port_swap, 16], [port_swap, 0], [port_swap, 0], [port_swap, 10],
			[port_swap, 0], [port_swap, 0], [port_swap, 10], [port_swap, 0],
			[port_swap, 7], [port_swap, 0], -1, -1,
			[-1, -1], [port_swap, 0], [change_variable, id, "cutProg", 2]];


