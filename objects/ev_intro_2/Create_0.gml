draw_difficulty = false;
confirm_difficulty = false;
difficulty_page = 0;
Xdifficulty = (global.game_width/2)-30;
Ydifficulty = (global.game_height/2)-35;

nameok = true;
delayCheck = true;
runText2 = false;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";

preText = [["    Yes", "    No"],
			"Please enter your name."];
preSpeakers = [id,id];
preNext_line = [[-1,0],0];
preScripts = [[[change_variable, id, "nameok", false, id, "runText2", true],[create_name_creator]], -1];

if (global.playerName = "Noa"){
	text = [
			"Your name is...",
			global.playerName + "? I see it hasn't changed.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
			];
} else {
	text = [
			"Your name is...",
			global.playerName + "? Of course.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
			];
}

portrait_index = noone;
speakers = [id, id, id, id,id];
next_line = [0, 0, 0, 0, 0];
scripts = [-1,-1, -1, [change_variable, id, "draw_difficulty", true], -1];

text2 = [["    Yes", "    No"],
		"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
		"Perfect.",
		"Now...\nYou are ready to face the world.",
		"Good luck, and do the right thing."];
speakers2 = [id,id,id,id,id];
next_line2 = [[2,0],1,0,0,0];
scripts2 = [[[change_variable, id, "draw_difficulty", false, id, "confirm_difficulty", false],[change_variable, id, "draw_difficulty", true, id, "confirm_difficulty", false, obj_textbox, "proceed", false, id, "delayCheck", true]],-1,-1,-1,[goto_room]];
	