draw_sprite_stretched(spr_box, 0, x, y, width_full, height_full);
draw_set_color(c_white);
draw_set_font(fnt_8bit);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _scroll_push = max(0, hover - (visible_options_max-1));

for (l = 0; l < (visible_options_max); l++)
{
	if (l >= array_length(options)) break;
	draw_set_color(c_white);

	var _option_to_show = l + _scroll_push;
	var _str = options[_option_to_show][0];
	if (hover == _option_to_show)
	{
		draw_set_color(c_yellow);	
	}
	if (options[_option_to_show][3] == false) draw_set_color(c_gray);
	draw_text(x + xmargin, y + ymargin + l * height_line, _str);
}

draw_sprite(spr_arrow, 0, x + xmargin + 8, y + ymargin + ((hover - _scroll_push) * height_line) + 7);
