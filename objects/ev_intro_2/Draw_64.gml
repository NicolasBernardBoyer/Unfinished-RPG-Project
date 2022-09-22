if (draw_difficulty = true){
	draw_set_font(fnt_excelsior);
	switch(difficulty_page){
		case 0:
		draw_set_color(c_lime);
		draw_text(Xdifficulty+5, Ydifficulty, "Easy");
		draw_set_color(c_white);
		draw_text(Xdifficulty+85, Ydifficulty, ">>");
		draw_set_font(fnt_8bit);
		draw_text(Xdifficulty-140, Ydifficulty-48, "Enemies have less health and do less damage.");
		draw_text(Xdifficulty-140, Ydifficulty-32, "For less experienced players.");
		draw_set_font(fnt_excelsior);
		break;
		case 1:
		draw_set_color(c_yellow);
		draw_text(Xdifficulty, Ydifficulty, "Normal");
		draw_set_color(c_white);
		draw_text(Xdifficulty+85, Ydifficulty, ">>");
		draw_text(Xdifficulty-50, Ydifficulty, "<<");
		draw_set_font(fnt_8bit);
		draw_text(Xdifficulty-140, Ydifficulty-48, "Enemies have their standard health and damage.");
		draw_text(Xdifficulty-140, Ydifficulty-32, "The most balanced way to play the game.");
		draw_set_font(fnt_excelsior);
		break;
		case 2:
		draw_set_color(c_orange);
		draw_text(Xdifficulty+10, Ydifficulty, "Hard");
		draw_set_color(c_white);
		draw_text(Xdifficulty-50, Ydifficulty, "<<");
		draw_set_font(fnt_8bit);
		draw_text(Xdifficulty-140, Ydifficulty-48, "Enemies are more in numbers and hit harder.");
		draw_text(Xdifficulty-140, Ydifficulty-32, "For veterans who want to test their skills.");
		draw_set_font(fnt_excelsior);
		break;
	}
} else {
	draw_set_font(fnt_8bit);
}