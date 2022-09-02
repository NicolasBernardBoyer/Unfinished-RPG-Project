global.name_text_col = c_gray;
cutProg = 0;
dropSpeed = 0;
curve = animcurve_get_channel(ac_pitFall,0);

portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

text = ["Well, this is just great.",
		"We both could've been done with our days, you know.",
		"But instead, you had to walk onto the same cliff as me,",
		"and because of THAT, we're now gonna be stuck underground with no way out!",
		"..."];
speakers = [id,id,id,id,id];
next_line = [0,0,0,-1,-1];
scripts = [[change_variable, id, "portrait_index", 1],[change_variable, id, "portrait_index", 1],[change_variable, id, "portrait_index", 2],[change_variable, id, "cutProg", 2],-1];