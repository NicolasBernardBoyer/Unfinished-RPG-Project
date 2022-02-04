draw_set_font(fnt_8bit);

//Draw Box
draw_sprite(box, 0, box_x, box_y);
draw_text(text_x,text_y,dialogue);
draw_text(text_x,text_y+text_height,dialogue2);
draw_text(text_x,text_y+(text_height*2),dialogue3);

draw_set_font(fnt_excelsior);
fontSize = font_get_size(fnt_excelsior);
BUFFER = ceil(6);

#region DRAW CURRENT NAME

startY = 32;
startX = 92;

//Draw Current Name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(startX, startY, currentName);
draw_text(startX, startY + 2, spaces);

#endregion

#region DRAW LETTERS

startY = 72;
startX = 60;
var charCount = 1;

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