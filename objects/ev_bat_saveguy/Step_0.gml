if (obj_player.x > 188 and cutProg = 0){
	if (!instance_exists(obj_textbox)){
		obj_kat.portrait_index = 14;
		create_textbox(text, speakers, next_line, scripts);
	}
}

if (cutProg = 1){
	if (!instance_exists(obj_textbox)){
		obj_kat.portrait_index = 19;
		create_textbox(text2, speakers2, next_line2, scripts2);
	}
}





