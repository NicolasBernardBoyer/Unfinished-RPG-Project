// beginning of cutscene restrictions on player
// make them walk forward
obj_player.can_move = false;
obj_player.sprite_index = spr_player_walk_coat;
obj_player.image_speed = 1;

// stop obj_camera movement and set the y to 160
obj_camera.following = noone;
obj_camera.y = 160;