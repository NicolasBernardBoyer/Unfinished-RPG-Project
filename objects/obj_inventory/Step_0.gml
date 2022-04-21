if (inventorytab == 0 and ds_list_size(party) == 0){
	cursor = -1;
} else if (inventorytab == 1 and ds_list_size(consumables) == 0){
	cursor = -1;
} else if (inventorytab == 1 and ds_list_size(keyitems) == 0){
	cursor = -1;
}

#region MOVE THE CURSOR
else if (itemConsumeMenu == false){
	if (inventorytab == 0 and cursor == -1){
		if (global.PD and cursor == -1){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	} else if (inventorytab == 1 and cursor == -1){
		if (global.PD and cursor == -1){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	}
	else if (inventorytab == 2 and cursor == -1){
		if (global.PD and cursor == -1){
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
else if (itemConsumeMenu == true and inventorytab == 1){
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
#region KEY ITEM USAGE
else if (itemConsumeMenu == true and inventorytab == 2){
	if (global.PD and cursor == 0){
		cursor += 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PD and cursor == 1){
		cursor = 0;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PU and cursor == 1){
		cursor -= 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.PU and cursor == 0){
		cursor = 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if (global.POK){
		
	}
}
#endregion

if (cursor >= cursorLimit){
	cursor = 0;
	
} else if (cursor < -1 and !itemConsumeMenu){
	cursor = -1;
} else if (cursor < 0 and itemConsumeMenu){
	cursor = 0;
}

#endregion

#region INVENTORY TAB CHANGE
if(cursor == -1 and itemConsumeMenu == false){
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


