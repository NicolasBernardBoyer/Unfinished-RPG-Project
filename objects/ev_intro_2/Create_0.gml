draw_difficulty = false;
confirm_difficulty = false;
difficulty_page = 0;
// x and y variables for position of difficulty text
Xdifficulty = (global.game_width/2)-30;
Ydifficulty = (global.game_height/2)-35;

// name confirmation, delayCheck
nameok = true;
delayCheck = true;
runText2 = false;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";

// If name isn't correct, ask the player to enter it again
preText = ["Is this name correct?",
			["Yes", "No"],
			"Please enter your name."];
preSpeakers = [id,id,id];
preNext_line = [0,[-1,0],0];
preScripts = [-1,[[change_variable, id, "nameok", false, id, "runText2", true],[create_name_creator]], -1];

// Special dialogue for the name Noa
if (global.player_name = "Noa"){
	text = [
			"Your name is...",
			global.player_name + "? It always was.",
			"Now it's time for you to choose your reality.",
			"The harsher reality is, the stronger you'll be.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.\n(Difficulty changes nothing lmao)",
			];
} else {
	text = [
			"Your name is...",
			global.player_name + "? Perfect.",
			"Now it's time for you to choose your reality.",
			"The harsher reality is, the stronger you'll be.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.\n(Difficulty changes nothing lmao)",
			];
}


portrait_index = noone;
speakers = [id, id, id, id,id];
next_line = [0, 0, 0, 0, 0];
scripts = [-1,-1, -1, [change_variable, id, "draw_difficulty", true], -1];

// Ask the player if that's the difficulty they want
text2 = ["Is this the difficulty you want?",
		["Yes", "No"],
		"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
		"...So that's how it is.",
		"Now...\nIt's time to wake UP.",
		"...Have fun."];
speakers2 = [id,id,id,id,id,id];
next_line2 = [0,[3,0],1,0,0,0];
scripts2 = [-1,[[change_variable, id, "draw_difficulty", false, id, "confirm_difficulty", false],[change_variable, id, "draw_difficulty", true, id, "confirm_difficulty", false, obj_textbox, "proceed", false, id, "delayCheck", true]],-1,-1,-1,[goto_room]];
	