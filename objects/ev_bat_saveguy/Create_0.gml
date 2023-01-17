
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

text2 = ["EEK! YOU'RE NAKED! WHAT EVEN ARE YOU?!?",
		 "Ugh, stop screaming, you're giving me a headache.",
		 "I'm NOT naked, I'm just wearing white clothes.",
		 "Man, people get offended by anything nowadays.",
		 "Who the HELL are you?",
		 "Can you not read the sign? I'm Save Guy.",
		 "There's no shot that's your actual name.",
		 "Uh, yes there is? I'm Save Guy, and that's that.",
		 "What even are you two doing down here? This area is off-limits, you know.",
		 "Oh? Are you an employee of Wolfred Entreprises?",
		 "No. My job is working as a save guy for the city.",
		 "Both of you should go back the way you came. The company's grunts are hostile.",
		 "We fell down here from a hole. We can't go back the same way we went in.",
		 "Well then, you'll need to be able to fight your way out.",
		 "Want me to teach you the ropes?",
		 "Thanks, but I can defend myself just fine.",
		 "What about your friend here?",
		 "Oh yeah, that's right. You don't have a weapon, do you " + global.playerName + "?",
		 "I can provide you with some wares, granted that you'll listen to my tutorial.",
		 "Will you participate in Save Guy's tutorial?",
		 ["Yes", "Yes"],
		 "You decided out of your own free will to participate.",
		 "Here, I'll give you this. You seem like the type to be good a swinging.",
		 "Besides, I sense zero potential for any sort of special power from you."
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
			 [0,0],0,0,0];
scripts2 = [[port_swap],[change_variable, id, "cutProg", 2]];


