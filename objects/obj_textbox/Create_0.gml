// --- Text State ---
str_len      = 0;
counter      = 0;
page         = 0;
pause        = false;
pause_delay  = false;
proceed      = true;

text[0]       = "";
text_wrapped  = "";
name          = "";

// --- Choice Dialogue ---
choice_dialogue  = false;
text_array       = undefined;
text_array_len   = 0;
choice           = 0;
choice_col       = c_yellow;

// --- Sprites ---
box      = spr_box;
frame    = spr_box_empty;
portrait = spr_kat_faces;

// --- Box Dimensions ---
box_width  = 480;
box_height = 88;
port_width  = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);

// --- Positioning ---
port_x = (global.game_width - box_width - port_width) * 0.5 + 45;
box_x  = (global.game_width - box_width) / 2;

if (global.highbox == true) {
    box_y   = 0;
    port_y  = box_height - 10;
    frame_y = 6;
} else {
    box_y   = global.game_height - box_height - 5;
    port_y  = (global.game_height * 0.98) - port_height - 2;
    frame_y = global.game_height - box_height + 6;
}

frame_x       = 40;
portraitspace = 80;

// --- Text Positioning ---
x_buffer      = 14;
y_buffer      = 10;
text_x        = box_x + x_buffer;
text_y        = box_y + y_buffer;
text_max_width = box_width - (2 * x_buffer);

// --- Text Appearance ---
text_col      = c_white;
name_text_col = c_white;
font          = fnt_8bit;
voice         = snd_typewriter;

draw_set_font(font);
text_height  = string_height("M");

// --- Portrait ---
portrait_index = 0;
global.hasname = true;

// --- Choice Text Positioning ---
ch_text_x = box_x + 8;
ch_text_y = text_y - 48;