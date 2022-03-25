instance_activate_object(obj_player);
instance_create_layer(543,0, "Transitions", obj_fade_in);
obj_fade_in.image_speed = 2;
with(obj_player){
	canMove = false;
	sprite_index = spr_player_leftbike;
	image_speed = 1;
}

