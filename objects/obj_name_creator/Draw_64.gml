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

#endregion

#region DRAW LETTERS

startY = 72;
startX = 60;
var charCount = 1;

for (var yy = 0; yy < yLetters; yy++){
	for (var xx = 0; xx < xLetters; xx ++){
		#region CODE INSIDE FOR LOOP
		
		var letter = a_letters[xx, yy];
		
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