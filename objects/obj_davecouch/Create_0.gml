visible = false;
hasText = true;
runOnce = false;
image_speed = 0;
image_index = 1;
global.name_text_col = c_orange;
interactCh = false;

voice = snd_typewriter;
name = "Dave";
moveCam = false;

portrait = spr_dave_faces;
portrait_index = 0;

evtext = ["You seem to have taken quite the tumble out of bed, "+ global.playerName+". You good?",
		 "You seem fine.\nGood luck on your first work day, roomie!",
		 "It's unfortunate that my boss didn't grant you the job at the hardware store.",
		 "But hey, what can you do.\nFood truck job's better than nothing, right?",
		 ["''I guess you're right.''","''I'd rather not work at all...''"],
		 "That's the spirit!\nMaybe I'll stop by for a burger today.",
		 "You don't have a choice.\nI can't be the only one paying rent.",
		 "Anyways, you missed this morning's news on TV.",
		 "Two beastmen got into a really intense street fight last night.",
		 "Some guy tried to break it up. Didn't end well for him.",
		 "Come to think of it, they showed a similar thing on TV last week.",
		 "In fact, I rarely ever see any news regarding humans committing violent crimes.",
		 ["''The news may be biased.''","''Beastmen are just naturally wild.''"],
		 "Naaaahh. That may be true for most media, but my sources are 100% non-biased.",
		 "Seems like a plausible explanation. They are half-animal, after all.",
		 "Sorry for rambling for this long. You should get to work."
		 ]; 
evspeakers =  [id,id,id, id,id,id,id,id,id,id,id,id,id,id,id,id,id];
evnext_line = [0,0,0,0,[5,6],7,7,0,0,0,0,0,[13,14],15,15,0];
evscripts = [-1,-1,[change_variable, obj_textbox, "portrait_index", 1],-1,[-1,[change_variable, obj_textbox, "portrait_index", 2]],
[change_variable, obj_textbox, "portrait_index", 0],
[change_variable, obj_textbox, "portrait_index", 0],-1,
[change_variable, obj_textbox, "portrait_index", 3],-1,-1,-1,
[[change_variable, obj_textbox, "portrait_index", 2],[change_variable, obj_textbox, "portrait_index", 0]],
[change_variable, obj_textbox, "portrait_index", 0],[change_variable, obj_textbox, "portrait_index", 0],[change_variable, id, "image_index", 1]];

text = ["Need something, roomie?",
		"You should really go to work.\nOtherwise, you'll be late.",
		"And you don't want to leave a negative first impression.",
		"Besides, I'm getting bored of talking to you. Let me watch TV."];
speakers = [id,id,id,id];
next_line = [0,0,0,0];
scripts = [-1,-1,[change_variable, obj_textbox, "portrait_index", 2],[change_variable, id, "interactCh", true]];

alttext = ["I'll talk to ya later."];
altspeakers = [id];
altnext_line = [0];
altscripts = -1;
