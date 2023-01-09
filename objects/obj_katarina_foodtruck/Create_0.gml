swapSprite = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		if (move_getup_y2 = true){
			sprite_index = spr_kat_leftwalk;
			image_index = 0;
			y-= 5;
			move_getup_y2 = false;
		}
		time_source_stop(swapSprite);
	}, [], 1);
	
approach = time_source_create(time_source_game, 60, time_source_units_frames, function()
	{
		image_speed = 1;
	}, [], 1);
	
anotherTB = time_source_create(time_source_game, 30, time_source_units_frames, function()
{
	if (!instance_exists(obj_textbox) and run3rdTextbox){
		create_facetextbox(text3, speakers3, next_line3, scripts3);
		run3rdTextbox = false;
	}
	time_source_stop(approach);
}, [], 1);

visible = false;

sprite_index = spr_kat_sit;

run2ndTextbox = false;
run3rdTextbox = false;
run4thTextbox = false;
//run5thTextbox = true;

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

//text2 = [["   ''Yep, that's me!''", "   ''Wait, how do you know my name?''"],
//		"..."
//		];
//speakers2 = [obj_player,id];
//next_line2 = [[-1,-1], 0];
//scripts2 = [
//			[[change_variable, id, "run4thTextbox", true, id,"portrait_index", 6],
//			 [change_variable, id, "run3rdTextbox", true, id,"portrait_index", 7]], 
//-1];

//text3 = ["Uh... well... uh... you see... I uh...",
//		"The manager told me, obviously! Hahahaha! Yeah! No other reason!",
//		"Anyways, let's, uh, change the subject and go over everything in the truck.",
//		"..."
//		];
//speakers3 = [id,id,id,id];
//next_line3 = [0,0,-1,-1];
//scripts3 = [[change_variable, id, "portrait_index", 12], 
//			-1,
//			[change_variable, id, "sprite_index", spr_kat_sit_getup, id, "portrait_index", 10],
//			-1];
			
text2 = ["Great! Let's get started then. Let me show you around.",
		"..."];
speakers2 = [id, id];
next_line2 = [-1, 0];
scripts2 = [[change_variable, id, "sprite_index", spr_kat_sit_getup, id, "portrait_index", 10, id, "run3rdTextbox", true], -1];

text3 = ["First, let's go over some rules.",
		"No.1, don't tell the boss when I'm slacking off.",
		"That one's really important, so don't forget it.",
		"..."];
speakers3 = [id,id,id,id];
next_line3 = [0,0,-1,0];
scripts3 = [[change_variable, id, "portrait_index", 8],
			-1,
			[change_variable, id, "run4thTextbox", true],
			-1];
			
text4 = ["That doesn't seem like an actual rule. I probably shouldn't listen to her...",
		"I'm just messing with ya. Go wash your hands so we can get started."];
speakers4 = [obj_player, id];
next_line4 = [0,0];
scripts4 = [[port_swap, 5],[change_variable, id, "end_scene", true]];	