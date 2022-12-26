shader_set(shader);
shader_set_uniform_f(u_strength, 1 /* use slider or another int */);
draw_sprite(sprite_1, 0, x, y);

//var ww = sprite_get_width(sprite_1);
//var hh = sprite_get_height(sprite_1);
//draw_sprite_general(sprite_1, 0, 0, 0, ww, hh, x - 0.5 * ww, y - 0.5 * hh, 1, 1, 0, c_red, c_green, c_yellow, c_blue, 1);

shader_reset();

