var c;
// text flicker effect by changing the color to black
draw_set_font(fnt_excelsior);
if (global.textvisible == true){
	c = c_yellow;
} else {
	c = c_black;
}
draw_text_color(global.game_width/3, global.game_height/2, "Press any button", c,c,c,c, 1);
