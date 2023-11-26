// make it so that our objects higher on the y axis are drawn first
visible		= false;

// variables that interact with rb_managercutscene
// (found in cutscenes under Opening City)
isWalking   = true;
moveCam		= true;
managerPass = false;
runOnce		= false;
radius		= 32;

has_text = false;
portrait_index = 0;
voice = snd_typewriter;
name = "The Manager";
text = ["There you are! You must be the new one. " + global.player_name + ", RIGHT?",
		"I've got to get to the shop DOWNtown. Apparently things are getting really busy DOWN there and they need my help.",
		"Don't worry, though! I know it's your first day, so I've got you covered.",
		"Someone else will be there to train you. She's a little shy, but she's great at her job.",
		"It'll be good for her to train someone. You know, to help her break out of her shell.",
		"Anyways, I gotta get going. Don't stress over your first day. I'm sure you'll do great! The truck is straight ahead.",
		"..."
		];
speakers = [id, id, id, id, id, id, id];
next_line = [0, 0, 0, 0, 0, 0, 0];
scripts = [-1, -1, -1, -1, -1, [let_manager_pass], -1];
