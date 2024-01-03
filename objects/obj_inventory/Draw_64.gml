// same conditions as step apply if they are met dont draw anything
if (global.can_pause == false) exit;
if (global.inventory_open == false) exit;
if (obj_game.do_transition) exit;
if (instance_exists(obj_textbox) and global.inventory_tb = false){ exit; }
else if (global.inventory_tb = true){
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
	if (cursor == -1 and party_cursor_active = false){
		draw_sprite(spr_inventory_tabs, 0, 42, 106);
	} else if (party_cursor_active){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	}
	else {
		draw_sprite(spr_inventory_tabs, 3, 42, 106);
	}
} else if (inventorytab == 1) {
	if (cursor == -1 and party_cursor_active = false){
		draw_sprite(spr_inventory_tabs, 1, 42, 106);
	} else if (party_cursor_active){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 4, 42, 106);
	}
} else if (inventorytab == 2) {
	if (cursor == -1 and party_cursor_active = false){
		draw_sprite(spr_inventory_tabs, 2, 42, 106);
	}
	else if (party_cursor_active){
		draw_sprite(spr_inventory_tabs, 6, 42, 106);
	} else {
		draw_sprite(spr_inventory_tabs, 5, 42, 106);
	}
}

#region DRAW PARTY OPTIONS
if (party_cursor_active == false){
	if (inventorytab == 0){
		cursor_limit = 0;
		for (var i = 0; i < PARTY_SLOTS; i += 1)
		{
			var xx = 124 + (i mod inventory_row_length)*128;
			var yy = 148 + (i div inventory_row_length)*24;
			if (ds_list_find_value(party, i) != undefined)
			{ 
				// draw party member names, store this in a better way later
				if (ds_list_find_value(party, i) == 0){
					if (cursor = i) text_col = c_yellow;
					draw_text_color(xx,yy,global.player_name,text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
					text = global.player_name;
					for (var ii = 0; ii < SELECTED_PARTY_SLOTS; ii += 1){
						if (ds_list_find_value(selected_party, ii) == 0){
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
						if (ds_list_find_value(selected_party, ii) == 1){
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
						if (ds_list_find_value(selected_party, ii) == 2){
							//draw checkmark
							draw_sprite(spr_checkmark, 0, xx+44, yy+5);
						}
					}
				}
				cursor_limit++;
				// insert the rest here when added
			}
			if (cursor = i){
				draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
			}
		}
	}
	#endregion

	#region DRAW AVAILABLE CONSUMABLES
	else if (inventorytab == 1 and item_consume_menu == false){
		cursor_limit = 0;
		for (var i = 0; i < INVENTORY_SLOTS; i += 1)
		{
			var xx = 124 + (i mod inventory_row_length)*128;
			var yy = 148 + (i div inventory_row_length)*24;
			if (ds_list_find_value(consumables, i) != undefined)
			{
				if (cursor = i) text_col = c_yellow;
				draw_text_color(xx,yy,ds_list_find_value(consumables, i),text_col,text_col,text_col,text_col, 1);
				text_col = c_white;
				cursor_limit++;
			}
			if (cursor = i){
				draw_sprite(spr_arrow, image_index/10, xx-55, yy+2);
			}
		}
	} 
	// draw the item consume obj_menu
	else if (inventorytab == 1 and item_consume_menu == true){
		draw_text(box_x+235, box_y+110, "Give to whom?");
		draw_line(210, 143, 210, 240);
		for (var i = 0; i < SELECTED_PARTY_SLOTS+1; i += 1){
			var xx = 280;
			var yy = 162 + i*16;
				// again this could be organized better, no need to draw all party member names like this
				if (ds_list_find_value(selected_party, i) == 0){
					if (cursor = i) text_col = c_yellow;
					draw_text_color(xx,yy,global.player_name,text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
					text = global.player_name;
				} else if (ds_list_find_value(selected_party, i) == 1){
					if (cursor = i) text_col = c_yellow;
					draw_text_color(xx,yy,"Katarina",text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
					text = "Katarina";
				} else if (ds_list_find_value(selected_party, i) == 2){
					if (cursor = i) text_col = c_yellow;
					draw_text_color(xx,yy,"Natalie",text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
					text = "Natalie";
				} else if (i == ds_list_size(selected_party)+1){
					if (cursor == 4) text_col = c_yellow;
					draw_text_color(xx,231,"Do not use",text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
				}
				cursor_limit++;
				// insert the rest here when added	
			if (cursor = i){
				if (i != ds_list_size(selected_party)+1 and i != 4){
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
		if (ds_list_find_value(consumables, consuming_item) = "Burger"){
			draw_set_halign(fa_left);
			draw_text(box_x+10, box_y+110, "A greasy burger");
			draw_text(box_x+10, box_y+126, "from the food truck.");
			draw_text(box_x+10, box_y+142, "It's disgusting.");
			for (var i = 0; i < SELECTED_PARTY_SLOTS; i += 1){
				if (cursor = i){
					
					if (ds_list_find_value(selected_party,i) = 0){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.player_atk) + " -> " + string(global.player_atk + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.player_spd) + " -> " + string(global.player_spd - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.player_hp) + " -> " + string(global.player_hp + 40));
						draw_set_color(c_white);
					} else if (ds_list_find_value(selected_party,i) = 1){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.kat_atk) + " -> " + string(global.kat_atk + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.kat_spd) + " -> " + string(global.kat_spd - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.kat_hp) + " -> " + string(global.kat_hp + 40));
						draw_set_color(c_white);
					} else if (ds_list_find_value(selected_party,i) = 2){
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+158, "ATK: " + string(global.nat_atk) + " -> " + string(global.nat_atk + 2));
						draw_set_color(c_red);
						draw_text(box_x+10, box_y+174, "SPD: " + string(global.nat_spd) + " -> " + string(global.nat_spd - 2));
						draw_set_color(c_lime);
						draw_text(box_x+10, box_y+190, "HP: " + string(global.nat_hp) + " -> " + string(global.nat_hp + 40));
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
		cursor_limit = 0;
		if (party_cursor_active == false){
			for (var i = 0; i < KEY_ITEM_SLOTS; i += 1)
			{
				var xx = 124 + (i mod inventory_row_length)*128;
				var yy = 148 + (i div inventory_row_length)*24;
				if (ds_list_find_value(keyitems, i) != undefined)
				{
					if (cursor = i) text_col = c_yellow;
					draw_text_color(xx,yy,ds_list_find_value(keyitems, i),text_col,text_col,text_col,text_col, 1);
					text_col = c_white;
					cursor_limit++;
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
		if (party_cursor == i){
			if (ds_list_find_value(selected_party, i) != undefined) {
				draw_text(box_x+10, box_y+110, "Name: ");
				draw_text(box_x+10, box_y+126, "Max HP: ");
				draw_text(box_x+10, box_y+142, "Attack: ");
				draw_text(box_x+10, box_y+158, "Defense: ");
				draw_text(box_x+10, box_y+174, "Speed: ");
				draw_text(box_x+10, box_y+190, "Luck: ");
				
				if (ds_list_find_value(selected_party, i) = 0){
					draw_text(box_x+100, box_y+110, global.player_name);
					draw_text(box_x+100, box_y+126, string(global.max_player_hp));
					draw_text(box_x+100, box_y+142, string(global.player_atk));
					draw_text(box_x+100, box_y+158, string(global.player_def));
					draw_text(box_x+100, box_y+174, string(global.player_spd));
					draw_text(box_x+100, box_y+190, string(global.player_lk));
				} 
				else if (ds_list_find_value(selected_party, i) = 1){
					draw_text(box_x+100, box_y+110, "Katarina");
					draw_text(box_x+100, box_y+126, string(global.max_kat_hp));
					draw_text(box_x+100, box_y+142, string(global.kat_atk));
					draw_text(box_x+100, box_y+158, string(global.kat_def));
					draw_text(box_x+100, box_y+174, string(global.kat_spd));
					draw_text(box_x+100, box_y+190, string(global.kat_lk));
				}
				else if (ds_list_find_value(selected_party, i) = 2){
					draw_text(box_x+100, box_y+110, "Natalie");
					draw_text(box_x+100, box_y+126, string(global.max_nat_hp));
					draw_text(box_x+100, box_y+142, string(global.nat_atk));
					draw_text(box_x+100, box_y+158, string(global.nat_def));
					draw_text(box_x+100, box_y+174, string(global.nat_spd));
					draw_text(box_x+100, box_y+190, string(global.nat_lk));
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
	var xx = 42 + (i mod party_row_length)*74;
	var yy = 32 + (i div party_row_length)*74;
	draw_sprite_stretched(spr_box_empty,0,xx,yy,74,74);
	if (ds_list_find_value(selected_party, i) != undefined) {
		draw_sprite(spr_party_faces, ds_list_find_value(selected_party, i),xx+1,yy+1);
		if (party_cursor_active == true and party_cursor == i){
			draw_sprite_stretched(spr_box_empty_white,0,xx+5,yy+5,64,64);
		}
		if (ds_list_find_value(selected_party, i) = 0){
			if (global.player_hp = global.max_player_hp) draw_set_color(c_lime);
			if (global.max_player_hp > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.player_hp <= global.max_player_hp){
					draw_text_transformed(xx+25, yy+1, global.player_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.max_player_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.max_player_hp, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.player_hp <= global.max_player_hp){
					draw_text_transformed(xx+34, yy+1, global.player_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.max_player_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.max_player_hp, 0.6, 0.6, 0);
			}
		}
		else if (ds_list_find_value(selected_party, i) = 1){
			if (global.kat_hp = global.max_kat_hp) draw_set_color(c_lime);
			if (global.max_kat_hp > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.kat_hp <= global.max_kat_hp){
					draw_text_transformed(xx+25, yy+1, global.kat_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.max_kat_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.max_kat_hp, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.kat_hp <= global.max_kat_hp){
					draw_text_transformed(xx+34, yy+1, global.kat_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.max_kat_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.max_kat_hp, 0.6, 0.6, 0);
			}
		} else if (ds_list_find_value(selected_party, i) = 2){
			if (global.nat_hp = global.max_nat_hp) draw_set_color(c_lime);
			if (global.max_nat_hp > 99) {
				draw_sprite_stretched(spr_box,0,xx+20,yy,54,18);
				if (global.nat_hp <= global.max_nat_hp){
					draw_text_transformed(xx+25, yy+1, global.nat_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+25, yy+1, global.max_nat_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+38, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+47, yy+5, global.max_nat_hp, 0.6, 0.6, 0);
			} else {
				draw_sprite_stretched(spr_box,0,xx+30,yy,44,18);
				if (global.nat_hp <= global.max_nat_hp){
					draw_text_transformed(xx+34, yy+1, global.nat_hp, 0.8, 0.8, 0);
				} else {
					draw_text_transformed(xx+34, yy+1, global.max_nat_hp, 0.8, 0.8, 0);
				}
				draw_text_transformed(xx+42, yy+2, " / ", 0.7, 0.7, 0);
				draw_text_transformed(xx+50, yy+5, global.max_nat_hp, 0.6, 0.6, 0);
			}
		}
		draw_sprite(spr_heart, 0, xx+66, yy+14);
		draw_set_color(c_white);
	} else {
		// if there is no character just draw text saying (empty)
		if (party_cursor_active == true and party_cursor == i){
			draw_sprite_stretched(spr_box_empty_white,0,xx+5,yy+5,64,64);
		}
		draw_text(xx+10, yy+28, "(Empty)");
	}
}
draw_set_halign(fa_left);