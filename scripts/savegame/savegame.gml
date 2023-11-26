// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_game(){
	//Create save map
	var map = ds_map_create();
	
	map[? "room"] = room;
	
	map[? "money"] = global.money;

	#region PLAYER STATS
	map[? "target_x"] = global.target_x;
	map[? "target_y"] = global.target_y;
	
	map[? "has_coat"] = global.has_coat;
	map[? "has_backpack"] = global.has_backpack;
	
	map[? "max_player_hp"] = global.max_player_hp;
	map[? "player_hp"] = global.player_hp;
	map[? "player_atk"] = global.player_atk;
	map[? "player_def"] = global.player_def;
	map[? "player_spd"] = global.player_spd;
	map[? "player_lk"] = global.player_lk;
	map[? "player_name"] = global.player_name;
	#endregion
	
	#region KATARINA STATS
	map[? "max_kat_hp"] = global.max_kat_hp;
	map[? "kat_hp"] = global.kat_hp;
	map[? "kat_atk"] = global.kat_atk;
	map[? "kat_def"] = global.kat_def;
	map[? "kat_spd"] = global.kat_spd;
	map[? "kat_lk"] = global.kat_lk;
	#endregion
	
	/*
	var _questMap = ds_map_create()
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap)
	*/
	
	//Save all of this to a string
	var str = json_encode(map);
	saveStringToFile("save" + string(global.game_save_slot) + ".sav", str);
	show_debug_message(str);
	
	//Nuke the data
	ds_map_destroy(map);
	show_debug_message("Game saved!");
}

function save_string_to_file(filename, str)
{
	var buffer = buffer_create(string_byte_length(str)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, str);
	buffer_save(buffer, str);
	buffer_delete(buffer);
}