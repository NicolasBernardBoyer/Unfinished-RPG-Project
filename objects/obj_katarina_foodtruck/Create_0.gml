visible = false;

sprite_index = spr_kat_sit;

run2ndTextbox = false;
run3rdTextbox = false;
run4thTextbox = false;
run5thTextbox = true;

end_scene = false;

move_getup_y = true;
move_getup_y2 = true;

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
		];
speakers = [id,id,id,id,id];
next_line = [0,0,0,-1,0];
scripts = 
[[change_variable, id, "portrait_index", 10, id, "sprite_index", spr_kat_sit_normal],
[change_variable, id, "portrait_index", 6],
[change_variable, id, "portrait_index", 3, id, "name", "Katarina"],
[change_variable, id, "run2ndTextbox", true],
-1
];

text2 = [["   ''Yep, that's me!''", "   ''Wait, how do you know my name?''"],
		"..."
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
		"..."
		];
speakers3 = [id,id,id,id];
next_line3 = [0,0,-1,-1];
scripts3 = [[change_variable, id, "portrait_index", 12], 
			-1,
			[change_variable, id, "sprite_index", spr_kat_sit_getup, id, "portrait_index", 10],
			-1];
			
text4 = ["Great! Let's get started then. Let me show you around.",
		"..."];
speakers4 = [id, id];
next_line4 = [-1, 0];
scripts4 = [[change_variable, id, "sprite_index", spr_kat_sit_getup, id, "portrait_index", 10], -1];

text5 = ["First, let's go over some rules.",
		"No.1, don't tell the boss if I'm on my phone when I'm supposed to be working.",
		"That one's really important, so don't forget it.",
		"..."];
speakers5 = [id,id,id,id];
next_line5 = [0,0,-1,0];
scripts5 = [[change_variable, id, "portrait_index", 8],
			-1,
			[change_variable, id, "end_scene", true],
			-1];