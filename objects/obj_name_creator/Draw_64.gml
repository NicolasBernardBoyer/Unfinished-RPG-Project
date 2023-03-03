//draw_set_font(fnt_8bit);

//Draw Box
//draw_sprite(box, 0, box_x, box_y);
//draw_text(text_x,text_y,dialogue);
//draw_text(text_x,text_y+text_height,dialogue2);
//draw_text(text_x,text_y+(text_height*2),dialogue3);

draw_set_font(fnt_excelsior);
fontSize = font_get_size(fnt_excelsior);
BUFFER = ceil(6);

#region DRAW CURRENT NAME

startY = global.game_width/3 + 32;
startX = global.game_height/3 + 92;

//Draw Current Name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(startX, startY, currentName);
draw_text(startX, startY + 2, spaces);

#endregion

#region DRAW LETTERS

startY = global.game_width/2 + 72;
startX = global.game_height/3 + 60;
var charCount = 1;

// Draw each letter and the confirmation for having finished the name
for (var yy = 0; yy < yLetters; yy++){
	for (var xx = 0; xx < xLetters; xx ++){
		#region CODE INSIDE FOR LOOP
		
		var letter = a_letters[xx, yy];
		
		if (showLowerCase) and (charCount <= 26){
			//Get the unicode for the letter and add 32 to it
			uniCode = ord(letter) + 32;
			letter = chr(uniCode);
		}
		
		var drawX = startX + (xx * (fontSize * 2));
		var drawY = startY + (yy * (fontSize + BUFFER));
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_text(drawX, drawY, letter);
		
		// Draw cursor
		if (a_letters[xx, yy] = "OK"){
			if (xx == gridX and yy == gridY) draw_sprite(spr_paw_select_wide, 0, drawX+4, drawY+10);
		} else {
			if (xx == gridX and yy == gridY) draw_sprite(spr_paw_select, 0, drawX+4, drawY+10);
		}

		
		charCount++;
		#endregion
	}
}
#endregion