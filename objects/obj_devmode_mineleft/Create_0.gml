global.playerName = "Nick";
room_goto(rm_mine_leftentrance);
instance_create_layer(170, 434, "Instances", obj_player);
instance_create_layer(170, 434, "Instances", obj_kat);
obj_player.hasBackpack = true;
obj_player.hasCoat = true;
