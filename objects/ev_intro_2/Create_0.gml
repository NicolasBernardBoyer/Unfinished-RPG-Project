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

preText = ["Is this name correct?",
			["Yes", "No"],
			"Please enter your name."];
preSpeakers = [id,id,id];
preNext_line = [0,[-1,0],0];
preScripts = [-1,[[change_variable, id, "nameok", false, id, "runText2", true],[create_name_creator]], -1];

if (global.playerName = "Noa"){
	text = [
			"My name is...",
			global.playerName + "? Oh yeah, it always was.",
			"Back when I was part of this reality, how hard was life?",
			"The harsher reality is, the stronger I'll get.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
			];
} else {
	text = [
			"My name is...",
			global.playerName + "? My memory's kinda foggy...",
			"Back when I was part of this reality, how hard was life?",
			"The harsher reality is, the stronger I'll get.",
			"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
			];
}

portrait_index = noone;
speakers = [id, id, id, id,id];
next_line = [0, 0, 0, 0, 0];
scripts = [-1,-1, -1, [change_variable, id, "draw_difficulty", true], -1];

text2 = ["Is this the difficulty you want?",
		["Yes", "No"],
		"Select your difficulty.\nThis can be changed at any point during gameplay in settings.",
		"Yeah... That's how things were.",
		"Now...\nTime to wake up, I guess.",
		"I must do the right thing."];
speakers2 = [id,id,id,id,id,id];
next_line2 = [0,[3,0],1,0,0,0];
scripts2 = [-1,[[change_variable, id, "draw_difficulty", false, id, "confirm_difficulty", false],[change_variable, id, "draw_difficulty", true, id, "confirm_difficulty", false, obj_textbox, "proceed", false, id, "delayCheck", true]],-1,-1,-1,[goto_room]];
	