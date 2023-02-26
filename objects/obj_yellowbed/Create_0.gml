visible = false;

// Alarms for creating the player object
alarm[0] = -1;
alarm[1] = -1;

// start by not playing the animation
image_speed = 0;

// booleans to check during cutscene
runAlarm = true;
textAlarm = false;
moveReady = false;


hasText = true;

voice = snd_typewriter;
name = "";

itext = ["Do the right thing, " + global.playerName + "!",
			 "I can't be late for your first day at my new job...",
			 "I'm working for a fast food company...",
			 "...",
			 "I don't want get up, but I don't have a choice."];
ispeakers = [id,id,id,id,id];
inext_line = [0,0,0,0,0];
iscripts = [-1,-1,-1,-1,[change_variable, id, "textAlarm", true]];

text[0] = "It's my bed.";
text[1] = "There are no dragons under it, sadly.";
portrait_index = noone;
speakers = [id, id];
next_line = [0,0];
scripts = [-1,
		   -1];
