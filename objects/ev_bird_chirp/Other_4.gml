// Play bird chirp sfx
if (!audio_is_playing(global.s_birds)){
	audio_play_sound(global.s_birds, 4, true);
}