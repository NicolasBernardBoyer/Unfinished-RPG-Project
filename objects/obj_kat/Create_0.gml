// make it so that our objects higher on the y axis are drawn first
visible = false;

has_text = false;
name_col = c_gray;

portrait_index = 0;
portrait = spr_kat_faces;
voice = snd_meow;
name = "Katarina";
text = [""];
speakers = [id];
next_line = [0];
scripts = -1;

walk = 1;
walking1 = false;
walking2 = false;
dir = point_direction(x,y,obj_player.x,obj_player.y);

