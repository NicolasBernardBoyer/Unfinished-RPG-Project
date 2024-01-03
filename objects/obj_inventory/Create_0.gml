// slot variables
#macro INVENTORY_SLOTS 8
#macro KEY_ITEM_SLOTS 8
#macro SELECTED_PARTY_SLOTS 4
#macro PARTY_SLOTS 8
// row inventory and length
party_row_length = 4;
inventory_row_length = 2;

// create a list for each party tab
keyitems = ds_list_create();
party = ds_list_create();
selected_party = ds_list_create();
consumables = ds_list_create();

// tab
inventorytab = 0;
randomize();

// seperate item obj_menu for consuming stuff
item_consume_menu = false;

// text color and text
text_col = c_white;
text="";

// cursor variables
cursor = -1;
party_cursor = 0;
party_cursor_active = false;
cursor_limit = 8;

// item states
consuming_item = 0;
usable_item = false;

// box sizes
box_x = 42;
box_y = 32;

// party members list
#region PARTY MEMBERS LIST
ds_list_add(party, 0);
// ds_list_add(party, 1);
// ds_list_add(party, 2);
#endregion

// party members that appear in battle list
#region SELECTED PARTY MEMBERS LIST
ds_list_add(selected_party, 0);
// ds_list_add(selected_party, 1);
// ds_list_add(selected_party, 2);
#endregion

// consumbables that the player owns
#region CONSUMABLES LIST
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
#endregion

// key items that the player owns
#region KEY ITEMS LIST
//ds_list_add(keyitems, "Lost Bat");
//ds_list_add(keyitems, "A thing");
//ds_list_add(keyitems, "Dumb key");
#endregion
