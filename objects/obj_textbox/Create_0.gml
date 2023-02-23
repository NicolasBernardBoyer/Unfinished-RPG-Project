// if the player isn't in a cutscene, stop their image index and speed to 0
if (instance_exists(obj_player)){
	with (obj_player){
		if (state != stateCutscene){
			image_index = 0;
			image_speed = 0;
		}
	}
}

// textbox and frame initialization
box = spr_textbox;
frame = spr_box_empty;

// set portrait to none at first, this will change based on who is talking
portrait = noone;

// box size variables
box_width = sprite_get_width(box);
box_height = sprite_get_height(box);
port_width = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);

// if whoever talking has a name
global.hasname = true;

// proceed is being able to press Z and have the text continue.
// it will be set to false when we cant text not to be skipped.
proceed = true;

// portrait positioning
port_y = (global.game_height*0.98) - port_height - 2;
port_x = (global.game_width - box_width - port_width) * 0.5 + 45;
box_x = 32;

// display box at the top or bottom of the screen depending on the highbox global
if(global.highbox = true){
	box_y = 0;
	port_y = box_height-10;
	frame_y = 6;
} else {
	box_y = 200;
	port_y = (global.game_height*0.98) - port_height - 2;
	frame_y = 206;
}

// Texbox frame if there is one added in the future
frame_x = 40;

// Extra space to offset the text to make room for a portrait if there is one
portraitspace = 80;

// text buffer, text position is equal to the buffer plus the box position
x_buffer = 14;
y_buffer = 10;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;

// portrait index is the frame of the portrait to draw
portrait_index = 0;
// counter is a timer that runs to display typewriter text and sound
counter = 0;
// pausing when there are commas in the counter variable
pause = false;
pauseDelay = false;

// display text color and name text color as well as the font
text_col = c_white;
name_text_col = c_white;
font = fnt_8bit;

// set the font
draw_set_font(font);
// reference for the height of text
text_height = string_height("M");

// text border so that it doesn't overflow outside the textbox
text_max_width = box_width - (2*x_buffer);
// there are default variables for textboxes, they will give changed based off
// whatever runs it
text[0] = "";
page = 0;
name = "";
voice = snd_typewriter;

// keys to interact, change these to the global variables
interact_key = ord("Z");
other_interact_key = ord("X");
interact_button = gp_face1;

// choice dialogue color and choice hover
choice = 0;
choice_col = c_yellow;

// choice text positioning
ch_text_x = 38;
ch_text_y = text_y-48;


