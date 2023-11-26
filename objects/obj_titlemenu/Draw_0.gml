
if (ev_title_screen.titleMenu = true){
	//draw the menu background

	//draw the options
	draw_set_font(fnt_excelsior);
	draw_set_valign(fa_top);
	draw_set_halign(fa_LEFT);
	for (var i = 0; i < op_length; i++)
	{
		var _c = c_white;
		if (pos == i){
			_c = c_yellow
			draw_text_color(x+20, y + op_space*i, option[i], _c, _c, _c, _c, 1);
		}
		else {
			_c = c_white;
			draw_text_color(x, y + op_space*i, option[i], _c, _c, _c, _c, 1);
		}
	}
}
