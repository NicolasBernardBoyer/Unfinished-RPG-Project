global.name_text_col = c_gray;
cutProg = 0;
kat = obj_kat;

part2 = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
	if (!instance_exists(obj_textbox) and cutProg = 2){
		global.highbox = true;
		obj_kat.image_index = 2;
		create_facetextbox(text,speakers,next_line,scripts);
		time_source_stop(part2);
	}
}, [], 1);

part3 = time_source_create(time_source_game, 2, time_source_units_seconds, function() {
	if (!instance_exists(obj_textbox) and cutProg = 3){
		obj_kat.sprite_index = spr_kat_rightwalk;
		portrait_index = 10;
		create_facetextbox(text2,speakers2,next_line2,scripts2);
		time_source_stop(part3);
	}
}, [], 1);

part4 = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	if (!instance_exists(obj_textbox) and cutProg = 4){
		create_facetextbox(text3,speakers3,next_line3,scripts3);
	}
	time_source_stop(part4);
}, [], 1);

part5 = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	if (!instance_exists(obj_textbox) and cutProg = 6){
		create_facetextbox(text5,speakers5,next_line5,scripts5);
	}
	time_source_stop(part5);
}, [], 1);

spritewait = time_source_create(time_source_game, 10, time_source_units_frames, function() {
	if (cutProg = 7){
		obj_kat.image_index = 0;
		time_source_stop(spritewait);
		cutProg++;
	}
}, [], 1);


curve = ac_bubbleShatter;
curvePos = 0;
curveSpeed = 0.02;

portrait_index = 11;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

text = ["Well, I guess that thing wasn't as sturdy as I wanted it to be."];
next_line = [0];
speakers = [id];
scripts = [[change_variable, obj_kat, "sprite_index", spr_kat_dustoff, obj_kat, "image_speed", 1, id, "cutProg", 3]];

text2 = ["Nice landing, by the way."];
next_line2 = [0];
speakers2 = [id];
scripts2 = [[change_variable, id, "cutProg", 4]];

text3 = ["Well, if we are going to find a way back to the surface, we should stick together.",
		 "I hope your sense of direction is good, because mine sure isn't!"];
next_line3 = [0, 0];
speakers3 = [id, id];
scripts3 = [[change_variable, id, "portrait_index", 3],[change_variable, id, "cutProg", 5]];

text4 = ["Katarina joined your party."];
next_line4 = [0];
speakers4 = [id];
scripts4 = [[change_variable, id, "cutProg", 6]];

text5 = ["Oh, by the way.\nThese should come in handy."];
next_line5 = [0];
speakers5 = [id];
scripts5 = [[change_variable, id, "cutProg", 7]];

text6 = ["You got (2x) Brgr Burger."];
next_line6 = [0];
speakers6 = [id];
scripts6 = [[change_variable, id, "cutProg", 9]];

text7 = ["These are leftovers from the truck. I was going to give them to you.",
		 "I usually wouldn't recommend eating this stuff...\nIt's not very good for you.",
		 "However, we are in a bit of an emergency situation here.",
		 "Just, uh, please don't give me much. I DO NOT like that kind of food.",
		 "You should always be weary of the consequences food will have on your health.",
		 "And I mean that literally.\nIf you eat that stuff, you'll heal, but you'll lose MAX HP.",
		 "You will, however, gain some ATK.",
		 "And that's permanent, unless you eat another food that'll increase your MAX HP.",
		 "What I'm getting to is: watch what you eat, and watch what you give your friends to eat.",
		 "Oh, and one more thing. If someone LIKES the food you give them...",
		 "They'll probably get a stat bonus that the food doesn't normally give.",
		 "Same goes for food they don't like, they might lose certain stats if it sucks.",
		 "You can view a food's effect on party members in your inventory.",
		 "I hope you wrote all that down, cuz I ain't repeatin' it!"
		 ];
next_line7 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
speakers7 = [kat,kat,kat,kat,kat,kat,kat,kat,kat,kat,kat,kat,kat,kat];
scripts7 = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];



