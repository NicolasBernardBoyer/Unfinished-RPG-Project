
visible = false;

hasText = false;
portrait_index = 7;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";
text = ["OH UH... HEY BOSS! NO, I WASN'T SLACKING O-",
		"Wait, nevermind. It's just the newbie.",
		"H-hey there! I'm Katarina, and I'll be training you today.",
		"...",
		"So... uh... y-you ever worked in fast food before?",
		["    I've done this kind of thing before.", "    Nah, it's my first time."],
		"Nice! In that case, I'll go over things quickly.",
		"Oh... well that's fine. Work here is pretty simple. You'll get used to the flow."
		];
		
		
speakers = [id,id,id,id,id,id,id,id];
next_line = [0,0,0,0,0,[6,7],-1,-1];
scripts = [[change_variable, id, "portrait_index", 10],-1,-1,-1,-1,[-1,-1],-1,-1];