visible = false;

// event variables
has_text = true;
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

evtext = ["You seem to have taken quite the tumble out of bed, "+ global.player_name+". You good?",
		 "You seem fine.\nGood luck on your first work day, roomie!",
		 "It's unfortunate that my boss didn't grant you the job at the hardware store.",
		 "But hey, what can you do.\nFood truck job's better than nothing, RIGHT?",
		 ["''I guess you're RIGHT.''","''I'd rather not work at all...''"],
		 "That's the spirit!\nMaybe I'll stop by for a burger today.",
		 "You don't have a choice.\nI can't be the only one paying rent.",
		 "Anyways, you missed this morning's news on TV.",
		 "Animal control had to neutralize two dogs over some beef they had.",
		 "This city really has changed. Things aren't safe with these savages around.",
		 "Having them around has also made the housing crisis even worse.",
		 "Why couldn't they just, I don't know, stay feral or something?",
		 "Oh! Sorry for holding you off with my rambling. You should get to work."
		 
		 ]; 
evspeakers =  [id,id,id,id,id,  id,id,id,id,id,id,id,id,id,id,id,id];
evnext_line = [0, 0, 0, 0,[5,6],7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
evscripts = [-1,-1,[change_variable, obj_textbox, "portrait_index", 1],-1,[-1,[change_variable, obj_textbox, "portrait_index", 2]],
[change_variable, obj_textbox, "portrait_index", 0],
[change_variable, obj_textbox, "portrait_index", 0],-1,[port_swap, 3],[port_swap, 3],
-1,[port_swap,0],[change_variable, id, "image_index", 1]];

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
