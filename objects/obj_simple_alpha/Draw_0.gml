shader_set(shader);
shader_set_uniform_f(u_alpha, 1 /* use slider or another int */);
draw_sprite(sprite_1, 0, x, y);

shader_reset();

