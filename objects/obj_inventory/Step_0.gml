// if you're pausing, can't pause, inventory isn't open,
// doing a transition, or there is a textbox, exit
if (global.pause) exit;
if (global.can_pause == false) exit;
if (global.inventory_open == false) exit;
if (obj_game.do_transition) exit;
if (instance_exists(obj_textbox)) exit;

// If you press cancel and the item_consume_menu isnt open, quit the inventory
if (global.pcan and !item_consume_menu){
	audio_play_sound(global.s_back, 5, false);
	global.inventory_open = false;
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
if (cursor < 0 and party_cursor_active = false){
	if (global.pu and inventorytab = 0){
		audio_play_sound(global.s_typewriter, 5, false);
		party_cursor = 0;
		party_cursor_active = true;
	} else if (global.pu and inventorytab = 1){
		audio_play_sound(global.s_typewriter, 5, false);
		party_cursor = 1;
		party_cursor_active = true;
	} else if (global.pu and inventorytab = 2){
		audio_play_sound(global.s_typewriter, 5, false);
		party_cursor = 2;
		party_cursor_active = true;
	}
}
else if (party_cursor_active = true) {
	if (global.pd){
		cursor -= 2;
		party_cursor_active = false;
	}
	if (global.pr and party_cursor != 3){
		party_cursor++;
		audio_play_sound(global.s_typewriter, 5, false);
	} 
	else if (global.pr and party_cursor == 3){
		party_cursor = 0;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if (global.pl and party_cursor != 0){
		party_cursor--;
		audio_play_sound(global.s_typewriter, 5, false);
	} 
	else if (global.pl and party_cursor == 0) {
		party_cursor = 3;
		audio_play_sound(global.s_typewriter, 5, false);
	}
}
#endregion

#region MOVE THE CURSOR FOR ITEMS
// If the cursor isnt present and player presses down on a tab move the cursor down to 0
if (item_consume_menu == false and party_cursor_active = false){
	if (inventorytab == 0 and cursor == -1){
		if (global.pd and cursor == -1 and ds_list_size(party) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	} else if (inventorytab == 1 and cursor == -1){
		if (global.pd and cursor == -1 and ds_list_size(consumables) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	}
	else if (inventorytab == 2 and cursor == -1){
		if (global.pd and cursor == -1 and ds_list_size(keyitems) != 0){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
	}
	// if the cursor doesn't equal -1 then move it across the obj_menu
	else if (global.pd and cursor != -1){
		if (cursor = 6 or cursor = 7) cursor -= 6;
		else cursor += 2;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.pu and cursor != -1){
		cursor -= 2;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.pr and cursor != -1){
		if (cursor = 0 or cursor = 2 or cursor = 4 or cursor = 6) cursor += 1;
		else cursor -= 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	else if (global.pl and cursor != -1){
		if (cursor = 1 or cursor = 3 or cursor = 5 or cursor = 7) cursor -= 1;
		else cursor += 1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if (cursor != -1 and inventorytab = 1){
		// ask the player if they want consume an item
		if (global.pok){ 
			audio_play_sound(snd_select, 5, false);
			item_consume_menu = true;
			consuming_item = cursor;
			cursor = 0;
		}
	}
}
// moving the cursor the item consume obj_menu
else if (item_consume_menu == true and inventorytab == 1 and party_cursor_active == false){
		if(global.pcan){
			item_consume_menu = false;
			cursor = 0;
			audio_play_sound(global.s_back, 5, false);
		}
		if (cursor != 4){
		if (global.pd and cursor != ds_list_size(selected_party)-1){
			cursor += 1;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.pd and cursor == ds_list_size(selected_party)-1){
			cursor = 4;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.pu and cursor != 0){
			cursor -= 1;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		else if (global.pu and cursor == 0){
			cursor = 4;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		if (global.pok){
			ds_list_delete(consumables, consuming_item);
#region APplY ITEM EFFECTS
// item effects, this should be organized by changing them to be functions
	if (ds_list_find_value(consumables, consuming_item) = "Burger"){
		if (ds_list_find_value(selected_party, cursor) = 0){
			global.player_hp += 40;
			global.player_atk += 2;
			global.player_spd -= 2;
		} else if (ds_list_find_value(selected_party, cursor) = 1){
			global.kat_hp += 40;
			global.kat_atk += 2;
			global.kat_spd -= 2;
		} else if (ds_list_find_value(selected_party, cursor) = 2){
			global.nat_hp += 40;
			global.nat_atk += 2;
			global.nat_spd -= 2;
		}
	}
#endregion
			// after consuming, close the item consume obj_menu
			item_consume_menu = false;
			audio_play_sound(global.s_heal, 5, false);
			cursor = 0;
		}
	} else if (cursor == 4){
		if (global.pu){
			cursor = ds_list_size(selected_party)-1;
			audio_play_sound(global.s_typewriter, 5, false);
		} else if (global.pd){
			cursor = 0;
			audio_play_sound(global.s_typewriter, 5, false);
		}
		// if you press ok and the cursor is on cancel simple close the obj_menu
		if (global.pok){
			item_consume_menu = false;
			cursor = 0;
			audio_play_sound(global.s_select, 5, false);
		}
	}
}

// if the keyitems obj_menu is open and you cant use a keyitem then
if (inventorytab = 2 and cursor != -1){
	if (global.pok and usable_item = false) {
		audio_play_sound(global.s_buzz, 5, false);
	}
}
#endregion

// passing the cursor limit puts it back to 0
#region RESET CURSOR
if (party_cursor_active == false) {
	if (cursor >= cursor_limit){
		cursor = 0;
		party_cursor_active = false;
	} else if (cursor < -1 and !item_consume_menu){
		cursor = -1;
		party_cursor_active = false;
	} else if (cursor < 0 and item_consume_menu){
		cursor = 0;
		party_cursor_active = false;
	}
}
#endregion

#region INVENTORY TAB CHANGE
// move the inventory take
if(cursor == -1 and item_consume_menu == false and party_cursor_active == false){
	if(global.pr and inventorytab < 2){
		inventorytab++;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	} else if (global.pr and inventorytab >= 2){
		inventorytab = 0;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
	if(global.pl and inventorytab > 0){
		inventorytab--;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	} else if (global.pl and inventorytab <= 0){
		inventorytab = 2;
		cursor = -1;
		audio_play_sound(global.s_typewriter, 5, false);
	}
}
#endregion

#region ADD AND REMOVE PARTY MEMBERS
// add and remove party members from the party
if (inventorytab == 0 and cursor != -1){
	if (global.pok){ 
		if (cursor != 0){
			if (ds_list_find_index(selected_party, cursor) == -1){
				ds_list_add(selected_party, cursor);
			} else {
				ds_list_delete(selected_party, ds_list_find_index(selected_party, cursor));
			}
			audio_play_sound(global.s_select, 5, false);
		} else {
			audio_play_sound(global.s_buzz, 5, false);
		}
	}
}
#endregion


