// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadGame(_slot)
{
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if (file_exists(_file)){
		//Load the game data
		var _json = LoadJSONFromFile(_file);
		
		//global variables
		room = _json[? "room"];
		
		global.money = _json[? "money"];

		#region PLAYER STATS
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
	
		global.hasCoat = _json[? "hasCoat"];
		global.hasBackpack = _json[? "hasBackpack"];
	
		global.MAXplayerHP = _json[? "MAXplayerHP"];
		global.playerHP = _json[? "playerHP"];
		global.playerATK = _json[? "playerATK"];
		global.playerDEF = _json[? "playerDEF"];
		global.playerSPD = _json[? "playerSPD"];
		global.playerLK = _json[? "playerLK"];
		global.playerName = _json[? "playerName"];
		#endregion
	
		#region KATARINA STATS
		global.MAXkatHP = _json[? "MAXkatHP"];
		global.katHP = _json[? "katHP"];
		global.katATK = _json[? "katATK"];
		global.katDEF = _json[? "katDEF"];
		global.katSPD = _json[? "katSPD"];
		global.katLK = _json[? "katLK"];
		#endregion

		#region NATALIE STATS
		global.MAXnatHP = _json[? "MAXnatHP"];
		global.natHP = _json[? "natHP"];
		global.natATK = _json[? "natATK"];
		global.natDEF = _json[? "natDEF"];
		global.natSPD = _json[? "natSPD"];
		global.natLK = _json[? "natLK"];
		#endregion
	
		#region MOM STATS
		global.MAXmomHP = _json[? "MAXmomHP"];
		global.momHP = _json[? "momHP"];
		global.momATK = _json[? "momATK"];
		global.momDEF = _json[? "momDEF"];
		global.momSPD = _json[? "momSPD"];
		global.momLK = _json[? "momLK"];
		#endregion
	
		#region ROBERT STATS
		global.MAXrobHP = _json[? "MAXrobHP"];
		global.robHP = _json[? "robHP"];
		global.robATK = _json[? "robATK"];
		global.robDEF = _json[? "robDEF"];
		global.robSPD = _json[? "robSPD"];
		global.robLK = _json[? "robLK"];
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
		obj_player.x = _json[? "targetX"];
		obj_player.y = _json[? "targetY"];
		
		ds_map_destroy(_json);
		
		return true;
	}
	else
	{
		show_debug_message("no save in this slot");
		return false;
	}
}


function LoadJSONFromFile(_filename)
{
	var _buffer = buffer_load( _filename);
	var _string = buffer_read( _buffer, buffer_string);
	buffer_delete( _buffer );
	var _json = json_decode( _string);
	return _json;
}