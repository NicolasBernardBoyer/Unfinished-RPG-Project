obj_player.x = 224;
obj_player.y = 2;
obj_kat.x = 160;
obj_kat.y = 2;
obj_bubble.x = 191;
obj_bubble.y = 30;
obj_kat.sprite_index = spr_kat_fall;
with (obj_player){
	state = stateCutscene;
}
audio_stop_sound(snd_wind);
obj_player.canMove = false;
global.canPause = false;