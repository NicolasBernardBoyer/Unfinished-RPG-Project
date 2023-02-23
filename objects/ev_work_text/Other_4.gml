//remove the player's sprite
obj_player.sprite_index = noone;

//delay the first textbox by 60 frames
if (alarm[0] == -1){
	alarm[0] = 60;
}

//create a disposable kat object (so that we can use her portraits)
instance_create_layer(-100,-100, "Instances", obj_kat);

