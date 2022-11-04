box = spr_textbox;
frame = spr_box_empty;
portrait = noone;

box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
global.hasname = true;

proceed = true;

port_x = (global.game_width - box_width - port_width) * 0.5 + 45;
port_y = (global.game_height*0.98) - port_height - 2;
box_x = 32;

if(global.highbox = true){
	box_y = 0;
	frame_y = 6;
} else {
	box_y = 200;
	frame_y = 206;
}

frame_x = 40;

x_buffer = 14;
y_buffer = 10;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

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

interact_key = ord("Z");
other_interact_key = ord("X");
interact_button = gp_face1;

choice = 0;
choice_col = c_yellow;

ch_text_x = 64;
ch_text_y = text_y-48;


