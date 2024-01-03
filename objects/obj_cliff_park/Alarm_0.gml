// once timer is done, play falling animations and sfx
obj_katarina_crater_room.sprite_index = spr_kat_fall;
obj_player.sprite_index = spr_player_falling_coat_left;
obj_katarina_crater_room.image_speed = 1;
obj_player.image_speed = 1;
audio_play_sound(snd_rockfall, 5, false);
drop_off = true;
