// Draw the name that the player entered
if (!instance_exists(obj_name_creator) and nameok){
	//draw_set_font(fnt_8bit);
	//draw_set_color(c_white);
	//draw_text(95,63, "Is this the name you want?");
	//draw_set_color(c_yellow);
	draw_set_font(fnt_excelsior);
	draw_text(120,83, global.player_name);
	draw_set_font(fnt_8bit);
	draw_set_color(c_white);
}

// Draw difficulty options ---> confirming selected difficulty
if (draw_difficulty = false and confirm_difficulty){
	//draw_set_font(fnt_8bit);
	//draw_set_color(c_white);
	//draw_text(85,63, "Is this the difficulty you want?");
	draw_set_font(fnt_excelsior);
		switch(global.difficulty_set){
			case 0:
				draw_set_color(c_lime);
				draw_text(120,83, "Easy");
			break;
			case 1:
				draw_set_color(c_yellow);
				draw_text(120,83, "Normal");
			break;
			case 2:
				draw_set_color(c_orange);
				draw_text(120,83, "Hard");
			break;
		}
	draw_set_font(fnt_8bit);
	draw_set_color(c_white);
}

// If not confirming display the possible difficulty options
if (draw_difficulty = true){
	draw_set_font(fnt_excelsior);
	switch(difficulty_page){
		case 0:
				draw_set_color(c_lime);
				draw_text(x_difficulty+5, y_difficulty, "Easy");
				draw_set_color(c_white);
				draw_text(x_difficulty+85, y_difficulty, ">>");
				draw_set_font(fnt_8bit);
				draw_text(x_difficulty-140, y_difficulty-48, "Enemies have less health and do less damage.");
				draw_text(x_difficulty-140, y_difficulty-32, "For less experienced players.");
				draw_set_font(fnt_excelsior);
			break;
			case 1:
				draw_set_color(c_yellow);
				draw_text(x_difficulty, y_difficulty, "Normal");
				draw_set_color(c_white);
				draw_text(x_difficulty+85, y_difficulty, ">>");
				draw_text(x_difficulty-50, y_difficulty, "<<");
				draw_set_font(fnt_8bit);
				draw_text(x_difficulty-140, y_difficulty-48, "Enemies have their standard health and damage.");
				draw_text(x_difficulty-140, y_difficulty-32, "The most balanced way to play the game.");
				draw_set_font(fnt_excelsior);
			break;
			case 2:
				draw_set_color(c_orange);
				draw_text(x_difficulty+10, y_difficulty, "Hard");
				draw_set_color(c_white);
				draw_text(x_difficulty-50, y_difficulty, "<<");
				draw_set_font(fnt_8bit);
				draw_text(x_difficulty-140, y_difficulty-48, "Enemies are more in numbers and hit harder.");
				draw_text(x_difficulty-140, y_difficulty-32, "For veterans who want to test their skills.");
				draw_set_font(fnt_excelsior);
			break;
	}
} else {
	draw_set_font(fnt_8bit);
}