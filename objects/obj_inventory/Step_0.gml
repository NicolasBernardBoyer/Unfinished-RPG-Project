// if you're pausing, can't pause, inventory isn't open,
// doing a transition, or there is a textbox, exit
if (global.pause) exit;
if (global.can_pause == false) exit;
if (global.inventoryOpen == false) exit;
if (obj_game.do_transition) exit;
if (instance_exists(obj_textbox)) exit;

// If you press cancel and the itemconsumemenu isnt open, quit the inventory
if (global.PCAN and !itemConsumeMenu){
	audio_play_sound(global.s_back, 5, false);
	global.inventoryOpen = false;
}

// If you're selecting a tab or if the size of the tab you're selecting is 0 cursor is always nonpresent
if (inventorytab == 0 and ds_list_size(party) == 0){
	cursor = -1;
} else if (inventorytab == 1 and ds_list_size(consumables) == 0){
	cursor = -1;
} else if (inventorytab == 2 and ds_list_size(keyitems) == 0){
	cursor = -1;
}

#region PARTY CURSOR
// Make cursor move
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

#region MOVE THE CURSOR FOR ITEMS
// If the cursor isnt present and player presses DOWN on a tab move the cursor DOWN to 0
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
	// if the cursor doesn't equal -1 then move it across the menu
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
		// ask the player if they want consume an item
		if (global.POK){ 
			audio_play_sound(snd_select, 5, false);
			itemConsumeMenu = true;
			consumingItem = cursor;
			cursor = 0;
		}
	}
}
// moving the cursor the item consume menu
else if (itemConsumeMenu == true and inventorytab == 1 and partyCursorActive == false){
		if(global.PCAN){
			itemConsumeMenu = false;
			cursor = 0;
			audio_play_sound(global.s_back, 5, false);
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
// item effects, this should be organized by changing them to be functions
	if (ds_list_find_value(consumables, consumingItem) = "Burger"){
		if (ds_list_find_value(selectedParty, cursor) = 0){
			global.player_hp += 40;
			global.player_atk += 2;
			global.player_spd -= 2;
		} else if (ds_list_find_value(selectedParty, cursor) = 1){
			global.kat_hp += 40;
			global.kat_atk += 2;
			global.kat_spd -= 2;
		} else if (ds_list_find_value(selectedParty, cursor) = 2){
			global.natHP += 40;
			global.natATK += 2;
			global.natSPD -= 2;
		}
	}
#endregion
			// after consuming, close the item consume menu
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
		// if you press ok and the cursor is on cancel simple close the menu
		if (global.POK){
			itemConsumeMenu = false;
			cursor = 0;
			audio_play_sound(global.s_select, 5, false);
		}
	}
}

// if the keyitems menu is open and you cant use a keyitem then
if (inventorytab = 2 and cursor != -1){
	if (global.POK and usableItem = false) {
		audio_play_sound(global.s_buzz, 5, false);
	}
}
#endregion

// passing the cursor limit puts it back to 0
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
// move the inventory take
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
// add and remove party members from the party
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


