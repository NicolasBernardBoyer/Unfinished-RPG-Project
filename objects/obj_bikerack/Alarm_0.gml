create_textbox(alttext,altspeakers,altnext_line,altscripts);
sprite_index = spr_bikerack_withbike;
with(obj_player){
	canMove = true;
	sprite_index = spr_player_leftwalk_coat;
	y+=5;
	image_index = 0;
}
instance_activate_object(inst_4D86892);