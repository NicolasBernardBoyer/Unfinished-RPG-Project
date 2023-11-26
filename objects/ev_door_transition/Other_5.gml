//If a room translation happens in your house, play door sfx
if (room == rm_yourbedroom or room == rm_yourbathroom or room == rm_yourhallway) {
	if (obj_game.do_transition = true) {
		audio_play_sound(snd_door, 5, false);
	}
}