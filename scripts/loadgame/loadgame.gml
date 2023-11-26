// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_game(slot)
{
	global.game_save_slot = slot;
	var file = "save" + string(global.game_save_slot) + ".sav";
	if (file_exists(file)){
		//Load the game data
		var json = loadJSONFromFile(file);
		
		//global variables
		room = json[? "room"];
		
		global.money = json[? "money"];

		#region PLAYER STATS
		global.target_x = json[? "target_x"];
		global.target_y = json[? "target_y"];
	
		global.has_coat = json[? "has_coat"];
		global.has_backpack = json[? "has_backpack"];
	
		global.max_player_hp = json[? "max_player_hp"];
		global.player_hp = json[? "player_hp"];
		global.player_atk = json[? "player_atk"];
		global.player_def = json[? "player_def"];
		global.player_spd = json[? "player_spd"];
		global.player_lk = json[? "player_lk"];
		global.player_name = json[? "player_name"];
		#endregion
	
		#region KATARINA STATS
		global.max_kat_hp = json[? "max_kat_hp"];
		global.kat_hp = json[? "kat_hp"];
		global.kat_atk = json[? "kat_atk"];
		global.kat_def = json[? "kat_def"];
		global.kat_spd = json[? "kat_spd"];
		global.kat_lk = json[? "kat_lk"];
		#endregion

		//lists to arrays
		//remember to put inventory and characters here
		/*
		for (var i = 0; i < ITEM.TYPE_COUNT; i++){
			global.playerItemUnlock[i] = _json[? "playerItemUnlocked"][| i];	
		}*/
		
		// Quest Data
		/*
		ds_map_copy(global.questStatus, _json[? "questStatus"]);
		*/
		
		//Room
		/*
		RoomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		*/
		
		//Player position
		obj_player.x = json[? "target_x"];
		obj_player.y = json[? "target_y"];
		
		ds_map_destroy(json);
		
		return true;
	}
	else
	{
		show_debug_message("no save in this slot");
		return false;
	}
}


function load_json_from_file(filename)
{
	var buffer = buffer_load(filename);
	var str = buffer_read( buffer, buffer_string);
	buffer_delete( buffer );
	var json = json_decode( string);
	return json;
}