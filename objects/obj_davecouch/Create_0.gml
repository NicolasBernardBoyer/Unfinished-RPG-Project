visible = false;
hasText = true;
runOnce = false;
image_speed = 0;
image_index = 1;
global.name_text_col = c_orange;

voice = snd_typewriter;
name = "Dave";
moveCam = false;

portrait = spr_dave_faces;
portrait_index = 0;

evtext = ["You seem to have taken quite the tumble out of bed, "+ global.playerName+". You good?",
		 "You seem fine.\nGood luck on your first work day, roomie!",
		 "It's unfortunate that my boss didn't grant you the job at the hardware store.",
		 "But hey, what can you do.\nFood truck job's better than nothing, right?",
		 ["I guess you're right.","I'd rather not work at all..."],
		 "That's the spirit!\nMaybe I'll stop by for a burger today.",
		 "You don't have a choice.\nI can't be the only one paying rent."];
evspeakers = [id,id,id,id,id,id,id];
evnext_line = [0,0,0,0,[5,6],-1,0];
evscripts = [-1,-1,[change_variable, obj_textbox, "portrait_index", 1],-1,[-1,[change_variable, obj_textbox, "portrait_index", 2]],-1,-1];

text = "It's the couch that Dave brought in.";
speakers = [id,id,id,id];
next_line = [0,0,0,0];
scripts = [-1,-1,-1,-1];
