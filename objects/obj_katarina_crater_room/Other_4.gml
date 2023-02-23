// beginning of cutscene restrictions on player
// make them walk forward
obj_player.canMove = false;
obj_player.sprite_index = spr_player_walk_coat;
obj_player.image_speed = 1;

// stop camera movement and set the y to 160
camera.following = noone;
camera.y = 160;