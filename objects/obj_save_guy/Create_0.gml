
// make it so that our objects higher on the y axis are drawn first
visible = false;

name_col = c_white;
kat = obj_kat;

text_rpt = false;

has_text = true;
portrait_index = 0;
portrait = spr_save_guy_faces;
voice = snd_typewriter;
name = "Save Guy";
text =  [""];
speakers = [id];
next_line =  [0];
scripts = [-1];

// state machines
state_idle = function(){
	sprite_index = spr_save_guy;
}

state_throw = function(){
	sprite_index = spr_save_guy_throw;
}

state = state_idle;

