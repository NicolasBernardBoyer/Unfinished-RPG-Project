name = names[page];
voice = voices[page];
portrait = portrait_imgs[page];

if (portrait != noone){
	text_max_width = box_width - (2*x_buffer) - 80;
} else {
	text_max_width = box_width - (2*x_buffer);
}

if(!is_array(text[page])){
	text_wrapped = string_wrap(text[page], text_max_width);
	str_len = string_length(text_wrapped);
	choice_dialogue = false;
} else {
	text_array = text[page];
	text_array_len =  array_length_1d(text_array);
	text_wrapped = string_wrap(text[page-1], text_max_width);
	str_len = string_length(text_wrapped);
	choice_dialogue = true;
}
counter = 0;