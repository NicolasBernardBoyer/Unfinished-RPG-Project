draw_set_font(fnt_8bit);
fontSize = font_get_size(fnt_8bit);
BUFFER = ceil(fontSize/2);

#region DRAW LETTERS

startY = 200;
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
		
		if (xx == gridX and yy == gridY) draw_sprite(0, 0, drawX, drawY);
		#endregion
	}
}
#endregion