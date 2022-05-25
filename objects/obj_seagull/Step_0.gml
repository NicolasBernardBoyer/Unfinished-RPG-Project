if (checkBench = true){
	text = alttext;
	speakers = altspeakers;
	next_line = altnext_line;
	scripts = altscripts;
}

var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_player, false, true);
if(inst != noone){
	global.name_text_col = c_orange;
}

