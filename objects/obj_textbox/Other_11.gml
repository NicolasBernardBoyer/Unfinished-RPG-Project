// --- Load data for current page ---
name          = names[page];
voice         = voices[page];
portrait      = portrait_imgs[page];
name_text_col = name_cols[page];

// Offset text if portrait is present
text_x = (portrait_imgs[page] != noone)
    ? box_x + x_buffer + portraitspace
    : box_x + x_buffer;

// On page 0, sync portrait frame to speaker
if (page == 0) {
    portrait_index = speakers[0].portrait_index;
}

// Apply name text color (fall back to global if not set for this page)
if (name_text_col != undefined) {
    global.name_text_col = name_text_col;
}

// Adjust text wrap width for portrait presence
text_max_width = (portrait != noone)
    ? box_width - (2 * x_buffer) - 80
    : box_width - (2 * x_buffer);

// --- Wrap text and determine if choice dialogue ---
if (!is_array(text[page])) {
    text_wrapped    = string_wrap(text[page], text_max_width);
    str_len         = string_length(text_wrapped);
    choice_dialogue = false;
} else {
    // Choice page: display the previous page's text, list choices as the array
    text_array      = text[page];
    text_array_len  = array_length_1d(text_array);
    text_wrapped    = string_wrap(text[page - 1], text_max_width);
    str_len         = string_length(text_wrapped);
    choice_dialogue = true;
}

counter = 0;