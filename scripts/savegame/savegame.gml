// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	//Create save map
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	
	_map[? "money"] = global.money;

	#region PLAYER STATS
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	
	_map[? "hasCoat"] = global.hasCoat;
	_map[? "hasBackpack"] = global.hasBackpack;
	
	_map[? "MAXplayerHP"] = global.MAXplayerHP;
	_map[? "playerHP"] = global.playerHP;
	_map[? "playerATK"] = global.playerATK;
	_map[? "playerDEF"] = global.playerDEF;
	_map[? "playerSPD"] = global.playerSPD;
	_map[? "playerLK"] = global.playerLK;
	_map[? "playerName"] = global.playerName;
	#endregion
	
	#region KATARINA STATS
	_map[? "MAXkatHP"] = global.MAXkatHP;
	_map[? "katHP"] = global.katHP;
	_map[? "katATK"] = global.katATK;
	_map[? "katDEF"] = global.katDEF;
	_map[? "katSPD"] = global.katSPD;
	_map[? "katLK"] = global.katLK;
	#endregion

	#region NATALIE STATS
	_map[? "MAXnatHP"] = global.MAXnatHP;
	_map[? "natHP"] = global.natHP;
	_map[? "natATK"] = global.natATK;
	_map[? "natDEF"] = global.natDEF;
	_map[? "natSPD"] = global.natSPD;
	_map[? "natLK"] = global.natLK;
	#endregion
	
	#region MOM STATS
	_map[? "MAXmomHP"] = global.MAXmomHP;
	_map[? "momHP"] = global.momHP;
	_map[? "momATK"] = global.momATK;
	_map[? "momDEF"] = global.momDEF;
	_map[? "momSPD"] = global.momSPD;
	_map[? "momLK"] = global.momLK;
	#endregion
	
	#region ROBERT STATS
	_map[? "MAXrobHP"] = global.MAXrobHP;
	_map[? "robHP"] = global.robHP;
	_map[? "robATK"] = global.robATK;
	_map[? "robDEF"] = global.robDEF;
	_map[? "robSPD"] = global.robSPD;
	_map[? "robLK"] = global.robLK;
	#endregion
	
	/*
	var _questMap = ds_map_create()
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap)
	*/
	
	//Save all of this to a string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	//Nuke the data
	ds_map_destroy(_map);
	show_debug_message("Game saved!");
}

function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}