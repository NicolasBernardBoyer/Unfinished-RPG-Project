// make it so that our objects higher on the y axis are drawn first
visible = false;

moveForward = true;
moveCam = false;
craterTextbox = false;

hasText = false;
portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";
text = ["Well, I guess it's just me.",
		"That's not a crater, it's just a massive hole.",
		"How the hell did this get here?",
		"..."];
speakers = [id,id,id,id];
next_line = [0,0,-1,0];
scripts = [-1,
[change_variable, id, "portrait_index", 1],
[change_variable, id, "moveCam", true],
-1];