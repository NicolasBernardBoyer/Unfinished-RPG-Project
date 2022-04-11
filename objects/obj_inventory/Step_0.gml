#region MOVE THE CURSOR
if (inventorytab == 0 and cursor == -1){
	if (global.PD and cursor == -1){
		cursor = 0;
		audio_play_sound(global.s_typewriter, 5, false);
	}
} else if (inventorytab == 1 and cursor == -1 and itemConsumeMenu == false){
	if (global.PD and cursor == -1){
		cursor = 0;
		audio_play_sound(global.s_typewriter, 5, false);
	}
} else if (itemConsumeMenu == true){
	
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

if (cursor >= cursorLimit){
	cursor = 0;
} else if (cursor < -1){
	cursor = -1;
}
#endregion

#region INVENTORY TAB CHANGE
if(cursor == -1){
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

#region CONSUME ITEM
	if (cursor != -1 and inventorytab = 1){
		if (global.POK and itemConsumeMenu == false){ 
			itemConsumeMenu = true;
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


