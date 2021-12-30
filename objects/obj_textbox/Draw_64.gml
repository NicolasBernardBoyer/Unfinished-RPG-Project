//Draw Box
draw_sprite(box, 0, box_x, box_y);

//Draw Portrait Back
//draw_sprite(frame, 0, port_x, port_y);

//Draw Portrait
//draw_sprite(portrait, portrait_indedx, port_x, port_y);

//Draw Portrait Frame
//draw_sprite(frame, 1, port_x, port_y);

//Draw Namebox
//draw_sprite(namebox, 0, namebox_x, namebox_y);

//----TEXT
draw_set_font(font);

//Draw Name
var c = name_text_col;
//draw_set_halign(fa_center); draw_set_valign(fa_middle);
//draw_text_color(name_text_x, name_text_y, name, c,c,c,c, 1);
//draw_set_halign(fa_left); draw_set_valign(fa_middle);

//Draw Text
c = text_col;
draw_text_ext_color(text_x, text_y, text[page], text_height, text_max_width, c,c,c,c, 1);
