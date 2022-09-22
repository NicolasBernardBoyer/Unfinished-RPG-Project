visible = false;

alarm[0] = -1;

global.name_text_col = c_gray;
voice = snd_typewriter;
name = "";
if (global.playerName = "Noa"){
	text = [
			global.playerName + "...I see it hasn't changed.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be...",
			"Select your difficulty."
			];
} else {
	text = [
			global.playerName + "...of course.",
			"Next, let us evaluate how cruel you would like the world to be towards you.",
			"Always remember that the harsher the world treats you, the stronger you'll be...",
			"Select your difficulty."
			];
}
		
		
portrait_index = noone;
speakers = [id, id, id, id, id, id,
			id, obj_game, id];
next_line = [0, 0, 0, 0, 0, 
			 0, 0, 0, 0];
scripts = [-1, -1, -1, -1,
		   -1, -1, -1, [goto_room], -1];