// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function backpack_pickup(){
	global.hasBackpack = true;
	
		if (obj_player.facing == dir.down) {
			obj_player.sprite_index = spr_player_walk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.up) {
			obj_player.sprite_index = spr_player_upwalk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.left) {
			obj_player.sprite_index = spr_player_leftwalk_bag;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.right) {
			obj_player.sprite_index = spr_player_rightwalk_bag;
			obj_player.image_index = 0;
		}
			

	instance_destroy(inst_17AEB05D);
	instance_destroy(obj_backpack);
	
}