if (global.pause) exit;
if (global.canPause == false) exit;

draw_sprite_stretched
(
	/* sprite */spr_box,
	/* frame */0,
	/* x */ box_x,
	/* y */ box_y,
	/* width */global.game_width-88,
	/* height */global.game_height-64
);

// DRAW CHANGING TABS
if (inventorytab == 0){
	if (cursor == -1){
		draw_sprite(spr_inventory_tabs, 0, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 3, 42, 106);
	}
} else if (inventorytab == 1) {
	if (cursor == -1){
		draw_sprite(spr_inventory_tabs, 1, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 4, 42, 106);
	}
} else if (inventorytab == 2) {
	if (cursor == -1){
		draw_sprite(spr_inventory_tabs, 2, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 5, 42, 106);
	}
}

// DRAW TEXT
draw_set_font(fnt_8bit);
draw_set_halign(fa_center);

#region FOR PARTY
if (inventorytab == 0){
	cursorLimit = 0;
	for (var i = 0; i < PARTY_SLOTS; i += 1)
	{
		var xx = 124 + (i mod inventoryRowLength)*128;
		var yy = 148 + (i div inventoryRowLength)*24;
		if (ds_list_find_value(party, i) != undefined)
		{ 
			if (ds_list_find_value(party, i) == 0){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,global.playerName,text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = global.playerName;
				for (var ii = 0; ii < SELECTED_PARTY_SLOTS; ii += 1){
					if (ds_list_find_value(selectedParty, ii) == 0){
						//draw checkmark
						draw_sprite(spr_checkmark, 0, xx+44, yy+5);
					}
				}
			} else if (ds_list_find_value(party, i) == 1){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,"Katarina",text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = "Katarina";
				for (var ii = 0; ii < SELECTED_PARTY_SLOTS; ii += 1){
					if (ds_list_find_value(selectedParty, ii) == 1){
						//draw checkmark
						draw_sprite(spr_checkmark, 0, xx+44, yy+5);
					}
				}
			} else if (ds_list_find_value(party, i) == 2){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,"Natalie",text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = "Natalie";
				for (var ii = 0; ii < SELECTED_PARTY_SLOTS; ii += 1){
					if (ds_list_find_value(selectedParty, ii) == 2){
						//draw checkmark
						draw_sprite(spr_checkmark, 0, xx+44, yy+5);
					}
				}
			}
			cursorLimit++;
			// insert the rest here when added
		}
		if (cursor = i){
			draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
		}
	}
}
#endregion

#region FOR CONSUMABLES
else if (inventorytab == 1 and itemConsumeMenu == false){
	cursorLimit = 0;
	for (var i = 0; i < INVENTORY_SLOTS; i += 1)
	{
		var xx = 124 + (i mod inventoryRowLength)*128;
		var yy = 148 + (i div inventoryRowLength)*24;
		if (ds_list_find_value(consumables, i) != undefined)
		{
			if (cursor = i) text_col = c_yellow;
			draw_text_color(xx,yy,ds_list_find_value(consumables, i),text_col,text_col,text_col,text_col, 1);
			text_col = c_white;
			cursorLimit++;
		}
		if (cursor = i){
			draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
		}
	}
} 
else if (inventorytab == 1 and itemConsumeMenu == true){
	draw_text(box_x+200, box_y+110, "Give to whom?");
	for (var i = 0; i < SELECTED_PARTY_SLOTS+1; i += 1){
		var xx = 124 + 128;
		var yy = 162 + i*16;
			if (ds_list_find_value(selectedParty, i) == 0){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,global.playerName,text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = global.playerName;
			} else if (ds_list_find_value(selectedParty, i) == 1){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,"Katarina",text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = "Katarina";
			} else if (ds_list_find_value(selectedParty, i) == 2){
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,"Natalie",text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				text = "Natalie";
			} else if (i == ds_list_size(selectedParty)+1){
				if (cursor == 4) text_col = c_yellow;
				draw_text_color(xx,231,"Do not use",text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
			}
			cursorLimit++;
			// insert the rest here when added	
		if (cursor = i){
			if (i != ds_list_size(selectedParty)+1 and i != 4){
				draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
			}else{
				draw_sprite(spr_arrow, image_index/10, xx-55, 234);
			}
		}
	}
}
#endregion

#region FOR KEY ITEMS
else if (inventorytab == 2){
	cursorLimit = 0;
	for (var i = 0; i < KEY_ITEM_SLOTS; i += 1)
	{
		var xx = 124 + (i mod inventoryRowLength)*128;
		var yy = 148 + (i div inventoryRowLength)*24;
		if (ds_list_find_value(keyitems, i) != undefined)
		{
			if (cursor = i) text_col = c_yellow;
			draw_text_color(xx,yy,ds_list_find_value(keyitems, i),text_col,text_col,text_col,text_col, 1);
			text_col = c_white;
			cursorLimit++;
		}
		if (cursor = i){
			draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
		}
	}
}
#endregion
draw_set_halign(fa_left);

// DRAW PARTY
for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1)
{
	var xx = 42 + (i mod partyRowLength)*74;
	var yy = 32 + (i div partyRowLength)*74;
	draw_sprite_stretched(spr_box_empty,0,xx,yy,74,74);
	if (ds_list_find_value(selectedParty, i) != undefined) {
		draw_sprite(spr_party_faces, ds_list_find_value(selectedParty, i),xx+1,yy+1);
		draw_sprite_stretched(spr_box,0,xx+32,yy,42,18);
		draw_sprite(spr_heart, 0, xx+66, yy+14);
		if (ds_list_find_value(selectedParty, i) = 0){
			draw_text_color(xx+36, yy+1, global.MAXplayerHP, c_white,c_white,c_white,c_white,1);
		} else if (ds_list_find_value(selectedParty, i) = 1){
			draw_text_color(xx+36, yy+1, global.MAXkatHP, c_white,c_white,c_white,c_white,1);
		} else if (ds_list_find_value(selectedParty, i) = 2){
			draw_text_color(xx+36, yy+1, global.MAXnatHP, c_white,c_white,c_white,c_white,1);
		}
	}
	else {
		draw_text(xx+10, yy+28, "(Empty)");
	}
}

if (inventorytab == 0){
	// draw_sprite(spr_arrow, image_index/10, 34, 116);
} else if (inventorytab == 1){
	// draw_sprite(spr_arrow, image_index/10, 134, 116);
} else if (inventorytab == 2){
	// draw_sprite(spr_arrow, image_index/10, 234, 116);
}
	