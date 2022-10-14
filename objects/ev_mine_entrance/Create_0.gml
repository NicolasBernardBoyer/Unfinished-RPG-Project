global.name_text_col = c_gray;
cutProg = 0;

curve = ac_bubbleShatter;
curvePos = 0;
curveSpeed = 0.02;

portrait_index = 10;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";

text = ["Nice landing."];
next_line = [0];
speakers = [id];
scripts = [change_variable(obj_kat, "sprite_index", spr_kat_dustoff)];



