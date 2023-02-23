// If any developer skips are active, do not run this cutscene
//if (instance_exists(obj_devmode)) instance_destroy(self);

global.name_text_col = c_gray;
cutProg = 0;
kat = obj_kat;

// Two second pause during the cutscene
twoSeconds1 = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
	// Runs when cutscene progression is at 2
	// Turns highboxes on and changes kat's sprite, as well as creates a textbox
	if (!instance_exists(obj_textbox) and cutProg = 2){
		global.highbox = true;
		obj_kat.image_index = 2;
		create_textbox(text,speakers,next_line,scripts);
		time_source_stop(twoSeconds1);
	}
}, [], 1);

// Two second pause during the cutscene
twoSeconds2 = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
	// Runs when cutscene progression is at 2
	// Turns highboxes on and changes kat's sprite, as well as creates a textbox
	if (!instance_exists(obj_textbox) and cutProg = 3){
		obj_kat.sprite_index = spr_kat_rightwalk;
		portrait_index = 10;
		create_textbox(text2,speakers2,next_line2,scripts2);
		time_source_stop(twoSeconds2);
	}
}, [], 1);

//Runs when cutscene progression is at 4. Creates a textbox.
part4 = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	if (!instance_exists(obj_textbox) and cutProg = 4){
		create_textbox(text3,speakers3,next_line3,scripts3);
	}
	time_source_stop(part4);
}, [], 1);

//Creates a delay during the 6th part of the cutscene before a sprite change
spritewait = time_source_create(time_source_game, 10, time_source_units_frames, function() {
	if (cutProg = 6){
		obj_kat.image_index = 0;
		time_source_stop(spritewait);
		cutProg++;
	}
}, [], 1);

//Curve for speed of the falling anim
curve = ac_bubbleShatter;
curvePos = 0;
curveSpeed = 0.02;

//This event's textbox variables are set to the same as Katarina's.
//This isn't a big deal but should not occur in the future.
portrait_index = 11;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

text = ["Well, I guess that barrier wasn't as sturdy as I wanted it to be."];
next_line = [0];
speakers = [id];
scripts = [[change_variable, obj_kat, "sprite_index", spr_kat_dustoff, obj_kat, "image_speed", 1, id, "cutProg", 3]];

text2 = ["Nice landing, by the way."];
next_line2 = [0];
speakers2 = [id];
scripts2 = [[change_variable, id, "cutProg", 4]];

text3 = ["Well, if we are going to find a way back to the surface, we should stick together.",
		 "I hope your sense of direction is good."];
next_line3 = [0, 0];
speakers3 = [id, id];
scripts3 = [[change_variable, id, "portrait_index", 3],[change_variable, id, "cutProg", 5]];

text4 = ["Katarina joined your party."];
next_line4 = [0];
speakers4 = [obj_player];
scripts4 = [[change_variable, id, "cutProg", 6]];

text5 = ["Now get us out of here, or I'll get you fired.",
		 "That, or we might both end up dead.",
		 "I'd worry more about getting fired."];
next_line5 = [0,0,0];
speakers5 = [kat,kat,kat];
scripts5 = [[change_variable, id, "portrait_index", 13],
			[change_variable, id, "portrait_index", 8],
			[change_variable, id, "cutProg", 9]];
			
			