// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coat_pickup(){
	global.hasCoat = true;
	
		if (obj_player.facing == dir.down) {
			obj_player.sprite_index = spr_player_walk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.up) {
			obj_player.sprite_index = spr_player_upwalk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.left) {
			obj_player.sprite_index = spr_player_leftwalk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == dir.right) {
			obj_player.sprite_index = spr_player_rightwalk_coat;
			obj_player.image_index = 0;
		} 
	
	inst_522B61D8.sprite_index = spr_coatrack;
	inst_522B61D8.voice = snd_typewriter;
	inst_522B61D8.name = "";
	inst_522B61D8.text = ["You've got everything ready already. Get out there and do your thing."];
	inst_522B61D8.portrait_index = noone;
	inst_522B61D8.speakers = [obj_coatrack];
	inst_522B61D8.next_line = [0];
	inst_522B61D8.scripts = [-1];
	
	instance_destroy(inst_458E5062);
	
}