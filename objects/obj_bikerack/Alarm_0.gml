var tbox = create_textbox(alttext,altspeakers,altnext_line,altscripts);
obj_player.active_textbox = tbox;
sprite_index = spr_bikerack_withbike;
audio_play_sound(snd_move, 5, false);
with(obj_player){
	canMove = true;
	sprite_index = spr_player_leftwalk_coat;
	y+=5;
	image_index = 0;
}
global.canPause = true;
instance_activate_object(inst_4D86892);
instance_activate_object(inst_3E94A422);