// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function backpack_pickup(){
	// reference that the player has their backpack
	global.has_backpack = true;
	// change player's sprite depending on the direction they're facing
		if (obj_player.facing == DIR.down) {
			obj_player.sprite_index = spr_player_walk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.up) {
			obj_player.sprite_index = spr_player_upwalk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.left) {
			obj_player.sprite_index = spr_player_leftwalk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.right) {
			obj_player.sprite_index = spr_player_rightwalk_bag;
			obj_player.image_index = 0;
		}
			

	instance_destroy(inst_17AEB05D);
	instance_destroy(obj_backpack);
	
}