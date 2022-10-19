visible = false;
alarm[0] = -1;
alarm[1] = -1;
image_speed = 0;
runAlarm = true;
textAlarm = false;
moveReady = false;
hasText = true;

voice = snd_typewriter;
name = "";

itext = ["Do the right thing, " + global.playerName + "!",
			 "You can't be late for your first day at your new job!",
			 "Cmon, buddy. Aren't you excited to work for Burgr, the world's number one fast food truck?",
			 "...",
			 "Get out of bed. I'm not asking you. I'm telling you."];
ispeakers = [id,id,id,id,id];
inext_line = [0,0,0,0,0];
iscripts = [-1,-1,-1,-1,[change_variable, id, "textAlarm", true]];

text[0] = "It's your bed.";
text[1] = "There are no dragons under it, sadly.";
portrait_index = noone;
speakers = [id, id];
next_line = [0,0];
scripts = [-1,
		   -1];
