// same conditions as step apply if they are met dont draw anything
if (global.canPause == false) exit;
if (global.inventoryOpen == false) exit;
if (obj_game.doTransition) exit;
if (instance_exists(obj_textbox) and global.inventoryTB = false){ exit; }
else if (global.inventoryTB = true){
	// make a tutorial if this is the first time the player opens the inventory
	instance_create_layer(0,0, "Instances", obj_inventorytutorial);
}

// draw the black box over the screen
draw_sprite_stretched
(
	/* sprite */spr_box_noborder,
	/* frame */0,
	/* x */ 0,
	/* y */ 0,
	/* width */global.game_width,
	/* height */global.game_height
);

// draw another box for where the items will be displayed
draw_sprite_stretched
(
	/* sprite */spr_box,
	/* frame */0,
	/* x */ box_x,
	/* y */ box_y,
	/* width */global.game_width-88,
	/* height */global.game_height-64
);

// draw the player's money
draw_sprite_stretched(spr_box, 0, 42, 9, 105, 24);
draw_sprite_stretched(spr_box, 0, 42, global.game_height-33, global.game_width-88, 24);
draw_text(48, 12, "MONEY: $" + string(global.money));

// DRAW TEXT
draw_set_font(fnt_8bit);
draw_set_halign(fa_center);

// draw instructions
draw_text_transformed(120, 260, "Z/    : Select/Confirm", 0.8, 0.8, 0);
draw_text_transformed(270, 260, "X/    : Back/Close", 0.8, 0.8, 0);
draw_sprite(spr_buttons, 0, 80, 267);
draw_sprite(spr_buttons, 1, 240, 267);



// DRAW CHANGING TABS
if (inventorytab == 0){
	if (cursor == -1 and partyCursorActive = false){
		draw_sprite(spr_inventory_tabs, 0, 42, 106);
	} else if (partyCursorActive){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	}
	else {
		draw_sprite(spr_inventory_tabs, 3, 42, 106);
	}
} else if (inventorytab == 1) {
	if (cursor == -1 and partyCursorActive = false){
		draw_sprite(spr_inventory_tabs, 1, 42, 106);
	} else if (partyCursorActive){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 4, 42, 106);
	}
} else if (inventorytab == 2) {
	if (cursor == -1 and partyCursorActive = false){
		draw_sprite(spr_inventory_tabs, 2, 42, 106);
	}
	else if (partyCursorActive){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 5, 42, 106);
	}
}

#region DRAW PARTY OPTIONS
if (partyCursorActive == false){
	if (inventorytab == 0){
		cursorLimit = 0;
		for (var i = 0; i < PARTY_SLOTS; i += 1)
		{
			var xx = 124 + (i mod inventoryRowLength)*128;
			var yy = 148 + (i div inventoryRowLength)*24;
			if (ds_list_find_value(party, i) != undefined)
			{ 
				// draw party member names, store this in a better way later
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

	#region DRAW AVAILABLE CONSUMABLES
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
	// draw the item consume menu
	else if (inventorytab == 1 and itemConsumeMenu == true){
		draw_text(box_x+235, box_y+110, "Give to whom?");
		draw_line(210, 143, 210, 240);
		for (var i = 0; i < SELECTED_PARTY_SLOTS+1; i += 1){
			var xx = 280;
			var yy = 162 + i*16;
				// again this could be organized better, no need to draw all party member names like this
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
// items list can be edited into seperate object in an array there is no need to do this
#region ITEMS LIST
// draw item descriptions
		#region BURGER
		if (ds_list_find_value(consumables, consumingItem) = "Burger"){
			draw_set_halign(fa_left);
			draw_text(box_x+10, box_y+110, "A greasy burger");
			draw_text(box_x+10, box_y+126, "from the food truck.");
			draw_text(box_x+10, box_y+142, "It's disgusting.");
			for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1){
				if (cursor = i){
					
					if (ds_list_find_value(selectedParty,i) = 0){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.playerATK) + " -> " + string(global.playerATK + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.playerSPD) + " -> " + string(global.playerSPD - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.playerHP) + " -> " + string(global.playerHP + 40));
						draw_set_color(c_white);
					} else if (ds_list_find_value(selectedParty,i) = 1){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.katATK) + " -> " + string(global.katATK + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.katSPD) + " -> " + string(global.katSPD - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.katHP) + " -> " + string(global.katHP + 40));
						draw_set_color(c_white);
					} else if (ds_list_find_value(selectedParty,i) = 2){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.natATK) + " -> " + string(global.natATK + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.natSPD) + " -> " + string(global.natSPD - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.natHP) + " -> " + string(global.natHP + 40));
						draw_set_color(c_white);
					}
				}
			}
			draw_set_halign(fa_center);
		}
		#endregion
		
		
#endregion
	}
	#endregion

#region DRAW AVAILABLE KEY ITEMS
	else if (inventorytab == 2){
		cursorLimit = 0;
		if (partyCursorActive == false){
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
	}
#endregion
#region DRAW PARTY STATS
} else {
	draw_set_halign(fa_left);
	for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1){
		if (partyCursor == i){
			if (ds_list_find_value(selectedParty, i) != undefined) {
				draw_text(box_x+10, box_y+110, "Name: ");
				draw_text(box_x+10, box_y+126, "Max HP: ");
				draw_text(box_x+10, box_y+142, "Attack: ");
				draw_text(box_x+10, box_y+158, "Defense: ");
				draw_text(box_x+10, box_y+174, "Speed: ");
				draw_text(box_x+10, box_y+190, "Luck: ");
				
				if (ds_list_find_value(selectedParty, i) = 0){
					draw_text(box_x+100, box_y+110, global.playerName);
					draw_text(box_x+100, box_y+126, string(global.MAXplayerHP));
					draw_text(box_x+100, box_y+142, string(global.playerATK));
					draw_text(box_x+100, box_y+158, string(global.playerDEF));
					draw_text(box_x+100, box_y+174, string(global.playerSPD));
					draw_text(box_x+100, box_y+190, string(global.playerLK));
				} 
				else if (ds_list_find_value(selectedParty, i) = 1){
					draw_text(box_x+100, box_y+110, "Katarina");
					draw_text(box_x+100, box_y+126, string(global.MAXkatHP));
					draw_text(box_x+100, box_y+142, string(global.katATK));
					draw_text(box_x+100, box_y+158, string(global.katDEF));
					draw_text(box_x+100, box_y+174, string(global.katSPD));
					draw_text(box_x+100, box_y+190, string(global.katLK));
				}
				else if (ds_list_find_value(selectedParty, i) = 2){
					draw_text(box_x+100, box_y+110, "Natalie");
					draw_text(box_x+100, box_y+126, string(global.MAXnatHP));
					draw_text(box_x+100, box_y+142, string(global.natATK));
					draw_text(box_x+100, box_y+158, string(global.natDEF));
					draw_text(box_x+100, box_y+174, string(global.natSPD));
					draw_text(box_x+100, box_y+190, string(global.natLK));
				}
			} else {
				draw_text(box_x+10, box_y+110, "This party slot is empty.");
			}
		}
	}
	draw_set_halign(fa_center);
}




#endregion
draw_set_halign(fa_left);


// DRAW PARTY FACES
// Draw text for character's HP
// Find a more efficient way to group this in the future
for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1)
{
	var xx = 42 + (i mod partyRowLength)*74;
	var yy = 32 + (i div partyRowLength)*74;
	draw_sprite_stretched(spr_box_empty,0,xx,yy,74,74);
	if (ds_list_find_value(selectedParty, i) != undefined) {
		draw_sprite(spr_party_faces, ds_list_find_value(selectedParty, i),xx+1,yy+1);
		if (partyCursorActive == true and partyCursor == i){
			draw_sprite_stretched(spr_box_empty_white,0,xx+5,yy+5,64,64);
		}
		if (ds_list_find_value(selectedParty, i) = 0){
			if (global.playerHP = global.MAXplayerHP) draw_set_color(c_lime);
			if (global.MAXplayerHP > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.playerHP <= global.MAXplayerHP){
					draw_text_transformed(xx+25, yy+1, global.playerHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.MAXplayerHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.MAXplayerHP, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.playerHP <= global.MAXplayerHP){
					draw_text_transformed(xx+34, yy+1, global.playerHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.MAXplayerHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.MAXplayerHP, 0.6, 0.6, 0);
			}
		}
		else if (ds_list_find_value(selectedParty, i) = 1){
			if (global.katHP = global.MAXkatHP) draw_set_color(c_lime);
			if (global.MAXkatHP > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.katHP <= global.MAXkatHP){
					draw_text_transformed(xx+25, yy+1, global.katHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.MAXkatHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.MAXkatHP, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.katHP <= global.MAXkatHP){
					draw_text_transformed(xx+34, yy+1, global.katHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.MAXkatHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.MAXkatHP, 0.6, 0.6, 0);
			}
		} else if (ds_list_find_value(selectedParty, i) = 2){
			if (global.natHP = global.MAXnatHP) draw_set_color(c_lime);
			if (global.MAXnatHP > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.natHP <= global.MAXnatHP){
					draw_text_transformed(xx+25, yy+1, global.natHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.MAXnatHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.MAXnatHP, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.natHP <= global.MAXnatHP){
					draw_text_transformed(xx+34, yy+1, global.natHP, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.MAXnatHP, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.MAXnatHP, 0.6, 0.6, 0);
			}
		}
		draw_sprite(spr_heart, 0, xx+66, yy+14);
		draw_set_color(c_white);
	} else {
		// if there is no character just draw text saying (empty)
		if (partyCursorActive == true and partyCursor == i){
			draw_sprite_stretched(spr_box_empty_white,0,xx+5,yy+5,64,64);
		}
		draw_text(xx+10, yy+28, "(Empty)");
	}
}
draw_set_halign(fa_left);