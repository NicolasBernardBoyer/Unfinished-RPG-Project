// audio emitter and counter for sfx
pick_em = audio_emitter_create();
counter = 0;

// make it so that our objects higher on the y axis are drawn first
visible = false;

name_col = c_dkgray;
kat = obj_kat;

textRpt = false;

hasText = true;
portrait_index = 0;
portrait = noone;
voice = snd_typewriter;
name = "Worker Ant";
text =  ["Working for the boss is a hard and boring task.",
		"Except when you're me, because I don't work.",
		"Uuuh... You seem to be working quite hard, though.",
		"I'm not working for my boss, I'm working for myself.",
		"He thinks I'm working, but I'm gatherin' resources for me and me only.",	
        "Well... uh... you missed quite a bit of coal and iron back there.",
		"I'm not aimin' for coal and iron, little lady. I'm aimin' for that sweet sweet diamond!"];
speakers = [id,id,
 kat,
 id,id,
 kat,
 id];
next_line =  [0,0,
 0,
 0,0,
 0,
 0];
scripts = [-1,-1,
 -1,
 [port_swap, 10], -1,
 -1,
 [change_variable, id, "textRpt", true]];

