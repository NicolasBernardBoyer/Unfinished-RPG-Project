// initialization for the 3 time sources that will run during the cutscene
swap_sprite = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		if (move_getup_y2 = true){
			sprite_index = spr_kat_leftwalk;
			image_index = 0;
			y-= 5;
			move_getup_y2 = false;
		}
		time_source_stop(swap_sprite);
	}, [], 1);
	
approach_event = time_source_create(time_source_game, 60, time_source_units_frames, function()
	{
		image_speed = 1;
	}, [], 1);
	
another_tb = time_source_create(time_source_game, 30, time_source_units_frames, function()
{
	if (!instance_exists(obj_textbox) and run_2nd_textbox){
		portrait_index = 10;
		create_textbox(text2, speakers2, next_line2, scripts2);
		run_2nd_textbox = false;
	}
	time_source_stop(approach_event);
}, [], 1);

visible = false;

sprite_index = spr_kat_sit;

// textbox running variables
run_2nd_textbox = false;

// scene parts 
end_scene = false;
move_getup_y = true;
move_getup_y2 = true;

has_text = false;
portrait_index = 7;
portrait = spr_kat_faces;
voice = snd_meow;
name = "???";
text = ["OH UH... HEY BOSS! NO, I WASN'T SLACKING O-",
		"Wait, nevermind. It's just the newbie.",
		"H-hey there! I'm Katarina, and I'll be training you today.",
		"You must be " + global.player_name + ", right?",
		"Great! Let's get started then. Let me show you around."];
speakers = [id,id,id,id,id];
next_line = [0,0,0,0,0];
scripts = 
[[change_variable, obj_textbox, "portrait_index", 10, id, "sprite_index", spr_kat_sit_normal],
[port_swap, 6],
[change_variable, obj_textbox, "portrait_index", 3, id, "name", "Katarina"],
[port_swap, 4],
[change_variable, id, "sprite_index", spr_kat_sit_getup, obj_textbox, "portrait_index", 10, id, "run_2nd_textbox", true]];

text2 = ["First, let's go over some rules.",
		"No.1, don't tell the boss when I'm slacking off.",
		"That one's really important, so don't forget it.",
		"That doesn't seem like an actual rule. I probably shouldn't listen to her...",
		"I'm just messing with ya. Go wash your hands so we can get started."];
speakers2 = [id,id,id,obj_player, id];
next_line2 = [0,0,0,0,0];
scripts2 = [[port_swap, 8],
			-1,
			-1,
			[port_swap, 5],[change_variable, id, "end_scene", true]];
