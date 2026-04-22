// Draw main textbox background
draw_sprite_stretched(box, 0, box_x, box_y, box_width, box_height);

draw_set_font(font);

// --- Draw Portrait ---
if (portrait != noone) {
    draw_sprite(portrait, portrait_index, port_x, port_y);
}

// --- Draw Name ---
if (name != "" && global.hasname == true) {
    var c = global.name_text_col;
    draw_text_color(text_x, text_y, "[" + name + "]", c, c, c, c, 1);
}

// --- Draw Dialogue Text ---
if (!choice_dialogue) {
    // Advance typewriter counter
    if (!pause && counter < str_len) {
        counter++;
        if (counter mod 4 == 0) {
            audio_play_sound(voice, 10, false);
        }

        // Pause at punctuation
        switch (string_char_at(text_wrapped, counter)) {
            case ",":
            case ";":
            case ":":
                pause = true;
                alarm[1] = 15;
                break;

            case ".":
            case "?":
            case "!":
                var next = string_char_at(text_wrapped, counter + 1);
                if (next != "." && next != "?" && next != "!") {
                    pause = true;
                    alarm[1] = 25;
                }
                break;
        }
    }

    var substr = string_copy(text_wrapped, 1, counter);
    var c      = text_col;
    var x_off  = (portrait != noone) ? text_x + 10 : text_x;
    var y_off  = (name != "")        ? text_y + text_height : text_y;

    draw_text_color(x_off, y_off, substr, c, c, c, c, 1);

// --- Draw Choice Dialogue ---
} else {
    // Calculate total height of all choices
    var box_yadd = 0;
    for (var ii = 0; ii < text_array_len; ii++) {
        box_yadd += string_height_ext(text_array[ii], text_height, global.game_width);
    }

    var c = text_col;

    if (!global.highbox) {
        draw_sprite_stretched(box, 0, 0, box_y - box_yadd - 8, global.game_width, box_yadd + 8);

        var y_add = 0;
        for (var i = 0; i < text_array_len; i++) {
            if (choice == i) {
                c = choice_col;
                draw_sprite(spr_arrow, image_index / 10, ch_text_x - 18, box_y - box_yadd + y_add);
            } else {
                c = text_col;
            }
            draw_text_ext_color(ch_text_x, box_y - box_yadd + y_add - 4, text_array[i], text_height, global.game_width, c, c, c, c, 1);
            y_add += string_height_ext(text_array[i], text_height, global.game_width);
        }
    } else {
        draw_sprite_stretched(box, 0, 0, box_y + box_yadd * 3 - 8, global.game_width, box_yadd + 8);

        var y_add = 0;
        for (var i = 0; i < text_array_len; i++) {
            if (choice == i) {
                c = choice_col;
                draw_sprite(spr_arrow, image_index / 10, ch_text_x - 18, box_y + box_yadd * 3 + y_add);
            } else {
                c = text_col;
            }
            draw_text_ext_color(ch_text_x, box_y + box_yadd * 3 + y_add - 4, text_array[i], text_height, global.game_width, c, c, c, c, 1);
            y_add += string_height_ext(text_array[i], text_height, global.game_width);
        }
    }

    // Redraw the previous page's text behind the choice box
    if (name != "") {
        draw_text_color(text_x, text_y + text_height, text_wrapped, c, c, c, c, 1);
    } else {
        draw_text_color(text_x, text_y, text_wrapped, c, c, c, c, 1);
    }
}