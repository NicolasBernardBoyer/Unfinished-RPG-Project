// Activate the player and trigger a fade in effect
instance_activate_object(obj_player);
instance_create_layer(0,0, "Transitions", obj_fade_in);
obj_fade_in.image_speed = 2;
// Stop the player from moving and enable biking animation
with(obj_player){
	canMove = false;
	sprite_index = spr_player_leftbike;
	image_speed = 1;
}
// Play biking sfx
audio_play_sound(global.s_bike, 1, true);


