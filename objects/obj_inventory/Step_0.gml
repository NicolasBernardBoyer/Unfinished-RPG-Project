#region MOVE THE CURSOR
if (inventorytab == 0 and cursor == -1){
	if (global.PD and cursor == -1){
		cursor = 0;
	}
} else if (inventorytab == 1 and cursor == -1){
	if (global.PD and cursor == -1){
		cursor = 0;
	}
} else if (inventorytab == 2 and cursor == -1){
	if (global.PD and cursor == -1){
		cursor = 0;
	}
}
else if (global.PD and cursor != -1){
	if (cursor = 6 or cursor = 7) cursor -= 6;
	else cursor += 2;
}
else if (global.PU and cursor != -1){
	cursor -= 2;
}
else if (global.PR and cursor != -1){
	if (cursor = 0 or cursor = 2 or cursor = 4 or cursor = 6) cursor += 1;
	else cursor -= 1;
}
else if (global.PL and cursor != -1){
	if (cursor = 1 or cursor = 3 or cursor = 5 or cursor = 7) cursor -= 1;
	else cursor += 1;
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
	} else if (global.PR and inventorytab >= 2){
		inventorytab = 0;
		cursor = -1;
	}

	if(global.PL and inventorytab > 0){
		inventorytab--;
		cursor = -1;
	} else if (global.PL and inventorytab <= 0){
		inventorytab = 2;
		cursor = -1;
	}
}
#endregion

#region ADD AND REMOVE PARTY MEMBERS
if (inventorytab == 0 and cursor != -1){
	if (global.POK){
			for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1)
			{
				if (selectedParty[i] == -1){
					selectedParty[i] = party[i];
				}
			}
		}
	}
#endregion

