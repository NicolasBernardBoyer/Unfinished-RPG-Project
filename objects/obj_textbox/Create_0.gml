box = spr_textbox;
frame = noone;
portrait = noone;
namebox = noone;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
namebox_width = sprite_get_width(namebox);
namebox_height = sprite_get_height(namebox);

port_x = (global.game_width - box_width - port_width) * 0.5;
port_y = (global.game_height*0.98) - port_height;
box_x = 31;
box_y = 191;
namebox_x = port_x;
namebox_y = box_y - namebox_height;

x_buffer = 14;
y_buffer = 10;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);

portrait_index = 0;
counter = 0;
pause = false;

text_col = c_white;
name_text_col = c_white;
font = fnt_8bit;

draw_set_font(font);
text_height = string_height("M");
text_max_width = box_width - (2*x_buffer);

text[0] = "";
page = 0;
name = "";
voice = snd_typewriter;

interact_key = ord("Z") or ord("X");


