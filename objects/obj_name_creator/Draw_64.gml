//draw_set_font(fnt_8bit);

//Draw Box
//draw_sprite(box, 0, box_x, box_y);
//draw_text(text_x,text_y,dialogue);
//draw_text(text_x,text_y+text_height,dialogue2);
//draw_text(text_x,text_y+(text_height*2),dialogue3);

draw_set_font(fnt_excelsior);
font_size = font_get_size(fnt_excelsior);
buffer = ceil(6);

#region DRAW CURRENT NAME

start_y = 32;
start_x = global.game_width/4;

//Draw Current Name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(start_x, start_y, current_name);
draw_text(start_x, start_y + 2, spaces);

#endregion

#region DRAW LETTERS

start_y = 72;
start_x = global.game_width/4;
var char_count = 1;

// Draw each letter and the confirmation for having finished the name
for (var yy = 0; yy < y_letters; yy++){
	for (var xx = 0; xx < x_letters; xx ++){
		#region CODE INSIDE FOR LOOP
		
		var letter = a_letters[xx, yy];
		
		if (show_lower_case) and (char_count <= 26){
			//Get the uni_code for the letter and add 32 to it
			uni_code = ord(letter) + 32;
			letter = chr(uni_code);
		}
		
		var draw_x = start_x + (xx * (font_size * 2));
		var draw_y = start_y + (yy * (font_size + buffer));
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(draw_x, draw_y, letter);
		
		// Draw cursor
		if (a_letters[xx, yy] = "OK"){
			if (xx == grid_x and yy == grid_y) draw_sprite(spr_paw_select_wide, 0, draw_x+4, draw_y+10);
		} else {
			if (xx == grid_x and yy == grid_y) draw_sprite(spr_paw_select, 0, draw_x+4, draw_y+10);
		}

		
		char_count++;
		#endregion
	}
}
#endregion