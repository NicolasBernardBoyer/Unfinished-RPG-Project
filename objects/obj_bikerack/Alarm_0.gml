// just to ensure that this works correctly
// deactivate roadblocks and set active textbox
var tbox = create_textbox(alttext,altspeakers,altnext_line,altscripts);
instance_deactivate_object(obj_rb_gotowork);
obj_player.active_textbox = tbox;

// get player off bike
sprite_index = spr_bikerack_withbike;
audio_play_sound(snd_move, 5, false);
// move player off bike and allow them to move again
with(obj_player){
	can_move = true;
	sprite_index = spr_player_leftwalk_coat;
	y+=5;
	image_index = 0;
}
global.can_pause = true;
// activate the wall on the right of the room
instance_activate_object(inst_4D86892);
instance_activate_object(inst_3E94A422);