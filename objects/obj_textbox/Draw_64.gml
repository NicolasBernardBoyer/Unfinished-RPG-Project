//Draw Box
draw_sprite(box, 0, box_x, box_y);

//Draw Portrait Back
//draw_sprite(frame, 0, port_x, port_y);

//Draw Portrait
//draw_sprite(portrait, portrait_index, port_x, port_y);

//Draw Portrait Frame
/*if (portrait != noone){
	draw_sprite_stretched(frame, 0, frame_x, frame_y, 76, 76);
} */

//Draw Namebox
//draw_sprite(namebox, 0, namebox_x, namebox_y);

//----TEXT
draw_set_font(font);

//Draw Name
if (name != "" and global.hasname = true){	
	var c = global.name_text_col;
	draw_text_color(text_x, text_y, name, c,c,c,c, 1);
}

if(!choice_dialogue){
	
if (name = "") {
//Draw Text if no name
	if(!pause and counter < str_len){
		counter++;
		if(counter mod 4 == 0){
			audio_play_sound(voice, 10, false);
		}
	
		switch(string_char_at(text_wrapped, counter)){
			case ",": 
			case ";":
			case ":": pause = true; alarm[1] = 15; break;
			case ".": 
			case "?":
			case "!": pause = true; alarm[1] = 25; break;
		}
	}
	var substr = string_copy(text_wrapped, 1, counter);

	c = text_col;
	draw_text_color(text_x, text_y, substr, c,c,c,c, 1);
} else {
	//Draw Text if name
	if(!pause and counter < str_len){
		counter++;
		if(counter mod 4 == 0){
			audio_play_sound(voice, 10, false);
		}
	
		switch(string_char_at(text_wrapped, counter)){
			case ",": 
			case ";":
			case ":": pause = true; alarm[1] = 15; break;
			case ".": 
			case "?":
			case "!": pause = true; alarm[1] = 25; break;
		}
	}
	var substr = string_copy(text_wrapped, 1, counter);

	c = text_col;
	draw_text_color(text_x, text_y+text_height, substr, c,c,c,c, 1);
	}
} else {
	var ii = 0, box_yadd = 0; repeat(text_array_len){
		box_yadd += string_height_ext(text_array[ii], text_height,global.game_width);
		ii++;
	}
	draw_sprite_stretched(spr_box_noborder, 0, 0, box_y-box_yadd-8,global.game_width,box_yadd+8);
	
	var i = 0, y_add = 0; repeat(text_array_len){
		if(choice == i){ c = choice_col; draw_sprite(spr_arrow, image_index/10, ch_text_x-20, box_y-box_yadd+y_add); }
		else c = text_col;
		
		draw_text_ext_color(ch_text_x, box_y-box_yadd+y_add-4, text_array[i], text_height, global.game_width, c,c,c,c, 1);
		y_add += string_height_ext(text_array[i], text_height,global.game_width);
		i++;
	}
	
	c = text_col;
	if (name != ""){
		draw_text_color(text_x, text_y+text_height, text_wrapped, c,c,c,c, 1);
	} else { draw_text_color(text_x, text_y, text_wrapped, c,c,c,c, 1); }
}