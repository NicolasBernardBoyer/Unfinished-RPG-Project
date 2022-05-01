if (global.pause) exit;
if (global.canPause == false) exit;
if (global.inventoryOpen == false) exit;
if (obj_game.doTransition) exit;
if (instance_exists(obj_textbox)) exit;

if (global.PCAN and !itemConsumeMenu){
	global.inventoryOpen = false;
}

if (inventorytab == 0 and ds_list_size(party) == 0){
	cursor = -1;
} else if (inventorytab == 1 and ds_list_size(consumables) == 0){
	cursor = -1;
} else if (inventorytab == 2 and ds_list_size(keyitems) == 0){
	cursor = -1;
}

#region PARTY CURSOR
if (cursor < 0 and partyCursorActive = false){
	if (global.PU and inventorytab = 0){
		audio_play_sound(global.s_typewriter, 5, false);
		partyCursor = 0;
		partyCursorActive = true;
	} else if (global.PU and inventorytab = 1){
		audio_play_sound(global.s_typewriter, 5, false);
		partyCursor = 1;
		partyCursorActive = true;
	} else if (global.PU and inventorytab = 2){
		audio_play_sound(global.s_typewriter, 5, false);
		partyCursor = 2;
		partyCursorActive = true;
	}
}
else if (partyCursorActive = true) {
	if (global.PD){
		cursor -= 2;
		partyCursorActive = false;
	}
	if (global.PR and partyCursor != 3){
		partyCursor++;
		audio_play_sound(global.s_typewriter, 5, false);
	} 
	else if (global.PR and partyCursor == 3){
		partyCursor = 0;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if (global.PL and partyCursor != 0){
		partyCursor--;
		audio_play_sound(global.s_typewriter, 5, false);
	} 
	else if (global.PL and partyCursor == 0) {
		partyCursor = 3;
		audio_play_sound(global.s_typewriter, 5, false);
	}
}
#endregion

#region MOVE THE CURSOR
if (itemConsumeMenu == false and partyCursorActive = false){
	if (inventorytab == 0 and cursor == -1){
		if (global.PD and cursor == -1 and ds_list_size(party) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	} else if (inventorytab == 1 and cursor == -1){
		if (global.PD and cursor == -1 and ds_list_size(consumables) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	}
	else if (inventorytab == 2 and cursor == -1){
		if (global.PD and cursor == -1 and ds_list_size(keyitems) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	}
	else if (global.PD and cursor != -1){
		if (cursor = 6 or cursor = 7) cursor -= 6;
		else cursor += 2;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PU and cursor != -1){
		cursor -= 2;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PR and cursor != -1){
		if (cursor = 0 or cursor = 2 or cursor = 4 or cursor = 6) cursor += 1;
		else cursor -= 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PL and cursor != -1){
		if (cursor = 1 or cursor = 3 or cursor = 5 or cursor = 7) cursor -= 1;
		else cursor += 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if (cursor != -1 and inventorytab = 1){
		if (global.POK){ 
			audio_play_sound(snd_select, 5, false);
			itemConsumeMenu = true;
			consumingItem = cursor;
			cursor = 0;
		}
	}
}
else if (itemConsumeMenu == true and inventorytab == 1 and partyCursorActive == false){
		if(global.PCAN){
			itemConsumeMenu = false;
			cursor = 0;
			audio_play_sound(global.s_select, 5, false);
		}
		if (cursor != 4){
		if (global.PD and cursor != ds_list_size(selectedParty)-1){
			cursor += 1;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.PD and cursor == ds_list_size(selectedParty)-1){
			cursor = 4;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.PU and cursor != 0){
			cursor -= 1;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.PU and cursor == 0){
			cursor = 4;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		if (global.POK){
			ds_list_delete(consumables, consumingItem);
#region APPLY ITEM EFFECTS
	if (ds_list_find_value(consumables, consumingItem) = "Burger"){
		if (ds_list_find_value(selectedParty, cursor) = 0){
			global.playerHP += 40;
			global.playerATK += 2;
			global.playerSPD -= 2;
		} else if (ds_list_find_value(selectedParty, cursor) = 1){
			global.katHP += 40;
			global.katATK += 2;
			global.katSPD -= 2;
		} else if (ds_list_find_value(selectedParty, cursor) = 2){
			global.natHP += 40;
			global.natATK += 2;
			global.natSPD -= 2;
		}
	}
#endregion
			itemConsumeMenu = false;
			audio_play_sound(global.s_heal, 5, false);
			cursor = 0;
		}
	} else if (cursor == 4){
		if (global.PU){
			cursor = ds_list_size(selectedParty)-1;
			audio_play_sound(global.s_typewriter, 5, false);
		} else if (global.PD){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		if (global.POK){
			itemConsumeMenu = false;
			cursor = 0;
			audio_play_sound(global.s_select, 5, false);
		}
	}
}

if (inventorytab = 2 and cursor != -1){
	if (global.POK and usableItem = false) {
		audio_play_sound(global.s_buzz, 5, false);
	}
}
#endregion

#region RESET CURSOR
if (partyCursorActive == false) {
	if (cursor >= cursorLimit){
		cursor = 0;
		partyCursorActive = false;
	} else if (cursor < -1 and !itemConsumeMenu){
		cursor = -1;
		partyCursorActive = false;
	} else if (cursor < 0 and itemConsumeMenu){
		cursor = 0;
		partyCursorActive = false;
	}
}
#endregion

#region INVENTORY TAB CHANGE
if(cursor == -1 and itemConsumeMenu == false and partyCursorActive == false){
	if(global.PR and inventorytab < 2){
		inventorytab++;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	} else if (global.PR and inventorytab >= 2){
		inventorytab = 0;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if(global.PL and inventorytab > 0){
		inventorytab--;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	} else if (global.PL and inventorytab <= 0){
		inventorytab = 2;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
}
#endregion

#region ADD AND REMOVE PARTY MEMBERS
if (inventorytab == 0 and cursor != -1){
	if (global.POK){ 
		if (cursor != 0){
			if (ds_list_find_index(selectedParty, cursor) == -1){
				ds_list_add(selectedParty, cursor);
			} else {
				ds_list_delete(selectedParty, ds_list_find_index(selectedParty, cursor));
			}
			audio_play_sound(global.s_select, 5, false);
		} else {
			audio_play_sound(global.s_buzz, 5, false);
		}
	}
}
#endregion


