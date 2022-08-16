if (instance_exists(obj_facetextbox)){
	if (obj_facetextbox.portrait = noone){
		obj_facetextbox.portrait = spr_kat_faces;
	}
	obj_facetextbox.portrait_index = portrait_index;
	obj_facetextbox.portrait = portrait;
	obj_facetextbox.name = name;
}

if (run2ndTextbox = true){
	instance_destroy(obj_textbox);
	create_textbox(text2, speakers2, next_line2, scripts2);
	run2ndTextbox = false;
}

if (run3rdTextbox = true){
	instance_destroy(obj_textbox);
	create_facetextbox(text3, speakers3, next_line3, scripts3);
	run3rdTextbox = false;
}

if (run4thTextbox = true){
	instance_destroy(obj_textbox);
	create_facetextbox(text4, speakers4, next_line4, scripts4);
	run4thTextbox = false;
}

if (sprite_index = spr_kat_sit_getup){
	image_speed = 1;
	if (image_index = 7){
		sprite_index = spr_kat_sit_getup2;
	}
}

if (sprite_index = spr_kat_sit_getup2 and image_index = 4){
	if (move_getup_y = true){
		image_speed = 0;
		y+= 5;
		move_getup_y = false;
	}

	swapSprite = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		if (move_getup_y2 = true){
			sprite_index = spr_kat_leftwalk;
			image_index = 0;
			y-= 5;
			move_getup_y2 = false;
		}
		time_source_stop(swapSprite);
	}, [], -1);
	time_source_start(swapSprite);
}

if (move_getup_y2 = false){
	approach = time_source_create(time_source_game, 60, time_source_units_frames, function()
	{
		image_speed = 1;
		x = Approach(x, 164, 1);
	}, [], -1);
	time_source_start(approach);
	
	if (x = 164){
		time_source_stop(approach);
		image_index = 0;
		image_speed = 0;
		
	anotherTB = time_source_create(time_source_game, 30, time_source_units_frames, function()
	{
		if (!instance_exists(obj_textbox) and run5thTextbox){
			create_facetextbox(text5, speakers5, next_line5, scripts5);
			run5thTextbox = false;
		}
		time_source_stop(approach);
	}, [], -1);
	time_source_start(anotherTB);
	}
}

if (end_scene){
	instance_destroy(obj_textbox);
	
	obj_game.spawnRoom = rm_workshift;
	obj_game.doTransition = true;
}

