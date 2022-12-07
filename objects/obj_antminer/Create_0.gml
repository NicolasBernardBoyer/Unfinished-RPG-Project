pick_em = audio_emitter_create();
counter = 0;

// make it so that our objects higher on the y axis are drawn first
visible = false;

kat = obj_kat;

hasText = true;
portrait_index = 0;
portrait = noone;
voice = snd_typewriter;
name = "Ant Worker";
text =  ["Working for Wolfreud is a hard and boring task.",
		"Except when you're me, because I don't work.",
		"Uuuh... You seem to be working quite hard, though.",
		"I'm not working for my boss, I'm working for myself.",
		"Whilst he thinks I'm working, I'm gatherin' resources for me and me only.",	
        "Well... uh... you missed quite a bit of coal and iron back there.",
		"I'm not aimin' for coal and iron, little lady. I'm aimin' for that sweet sweet diamond!",
		"What're you going to do with diamond?",
		"Simple. I will use this diamond to create a diamond pickaxe.",
		"My current one is only iron, you see.",
		"Then, I will use this diamond pick to find more diamond!",
		"...And then what?",
		"Then I will craft more diamond tools! And use those to find even more diamond!",
		"...I don't get it. What's the point of doing that?",
		"Of course you wouldn't get it. You're just a child.",
		"..."];
speakers = [id,id,
 kat,
 id,id,
 kat,
 id,
 kat,
 id,id,id,
 kat,
 id,
 kat,
 id,
 kat];
next_line =  [0,0,
 0,
 0,0,
 0,
 0,
 0,
 0,0,0,
 0,
 0,
 0,
 0,
 0];
scripts = [-1,-1,
 -1,
 [port_swap, 10], -1,
 -1,
 -1,
 -1,
 -1,-1,[port_swap, 16],
 -1,
 [port_swap, 16],
 -1,
 [port_swap, 15],
 -1];

