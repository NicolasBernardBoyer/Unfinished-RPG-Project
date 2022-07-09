visible = false;

run2ndTextbox = false;
run3rdTextbox = false;
run4thTextbox = false;

hasText = false;
portrait_index = 7;
portrait = spr_kat_faces;
voice = snd_meow;
name = "???";
text = ["OH UH... HEY BOSS! NO, I WASN'T SLACKING O-",
		"Wait, nevermind. It's just the newbie.",
		"H-hey there! I'm Katarina, and I'll be training you today.",
		"You must be " + global.playerName + ", right?",
		"..."
		/*"Nice! In that case, I'll go over things quickly.",
		"Oh... well that's fine. Work here is pretty simple. You'll get used to the flow."*/
		];
speakers = [id,id,id,id,id];
next_line = [0,0,0,-1,0];
scripts = 
[[change_variable, id, "portrait_index", 10, id, "sprite_index", spr_kat_sit_normal],
[change_variable, id, "portrait_index", 6],
[change_variable, id, "portrait_index", 12, id, "name", "Katarina"],
[change_variable, id, "run2ndTextbox", true],
-1
];

text2 = [["    Yep! That's me!", "    Wait, how do you know my name?"],
		"..."
		/*"Nice! In that case, I'll go over things quickly.",
		"Oh... well that's fine. Work here is pretty simple. You'll get used to the flow."*/
		];
speakers2 = [obj_player,id];
next_line2 = [[-1,-1], 0];
scripts2 = [
			[[change_variable, id, "run4thTextbox", true, id,"portrait_index", 6],
			 [change_variable, id, "run3rdTextbox", true, id,"portrait_index", 7]], 
-1];

text3 = ["Uh... well... uh... you see... I uh...",
		"The manager told me, obviously! Hahahaha! Yeah! No other reason!",
		"Anyways, let's, uh, change the subject and go over everything in the truck.",
		];
speakers3 = [id,id,id];
next_line3 = [0,0,0];
scripts3 = [[change_variable, id, "portrait_index", 12], 
			-1,
			-1];
			
text4 = ["Great! Let's get started then. Let me show you around."];
speakers4 = [id];
next_line4 = [0];
scripts4 = [-1];