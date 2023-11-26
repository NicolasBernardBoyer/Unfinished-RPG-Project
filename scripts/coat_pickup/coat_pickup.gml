// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coat_pickup(){
	// same as backpack but for the player's coat
	global.has_coat = true;
	
	//change player's sprite depending on DIRection
		if (obj_player.facing == DIR.DOWN) {
			obj_player.sprite_index = spr_player_walk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.UP) {
			obj_player.sprite_index = spr_player_upwalk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.LEFT) {
			obj_player.sprite_index = spr_player_leftwalk_coat;
			obj_player.image_index = 0;
		}
		if (obj_player.facing == DIR.RIGHT) {
			obj_player.sprite_index = spr_player_rightwalk_coat;
			obj_player.image_index = 0;
		} 
	
	//change text for the coat rack
	inst_522B61D8.sprite_index = spr_coatrack;
	inst_522B61D8.voice = snd_typewriter;
	inst_522B61D8.name = "";
	inst_522B61D8.text = ["You've got everything ready already. Get out there and do your thing."];
	inst_522B61D8.portrait_index = noone;
	inst_522B61D8.speakers = [obj_coatrack];
	inst_522B61D8.next_line = [0];
	inst_522B61D8.scripts = [-1];
	
	instance_activate_object(rb_leaveyourhouse);
	instance_destroy(inst_458E5062);
	
}