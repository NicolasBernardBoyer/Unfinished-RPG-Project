draw_difficulty = false;
difficulty_page = 0;
Xdifficulty = (global.game_width/2)-30;
Ydifficulty = (global.game_height/2)-35;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";
if (global.playerName = "Noa"){
	text = [
			global.playerName + "... I see it hasn't changed.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be.",
			"Select your difficulty."
			];
} else {
	text = [
			global.playerName + "... of course.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be.",
			"Select your difficulty. This can be changed at any point during gameplay in settings."
			];
}
	
portrait_index = noone;
speakers = [id, id, id, id];
next_line = [0, 0, 0, 0];
scripts = [-1, -1, [change_variable, id, "draw_difficulty", true], -1];