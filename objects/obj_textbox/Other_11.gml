// get variables for each page of the textbox
name = names[page];
voice = voices[page];
portrait = portrait_imgs[page];
name_text_col = name_cols[page];

// if the page is 0 get the portrait index from the speakers
if (page = 0){
	portrait_index = speakers[0].portrait_index;
}

// is there is no name text color just use to global variable to assign one
if (name_text_col != noone){
global.name_text_col = name_text_col;
}

// text width is larger if there is a portrait
if (portrait != noone){
	text_max_width = box_width - (2*x_buffer) - 80;
} else {
	text_max_width = box_width - (2*x_buffer);
}

// check if the page is a choice dialogue or not
if(!is_array(text[page])){
	text_wrapped = string_wrap(text[page], text_max_width);
	str_len = string_length(text_wrapped);
	choice_dialogue = false;
} else {
// display past text with text_wrapped if choice dialogue
// past text is equal to the page before, hence page - 1
	text_array = text[page];
	text_array_len =  array_length_1d(text_array);
	text_wrapped = string_wrap(text[page-1], text_max_width);
	str_len = string_length(text_wrapped);
	choice_dialogue = true;
}
counter = 0;