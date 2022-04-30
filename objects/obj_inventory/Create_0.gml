
#macro INVENTORY_SLOTS 8
#macro KEY_ITEM_SLOTS 8
#macro SELECTED_PARTY_SLOTS 4
#macro PARTY_SLOTS 8
partyRowLength = 4;
inventoryRowLength = 2;

keyitems = ds_list_create();
party = ds_list_create();
selectedParty = ds_list_create();
consumables = ds_list_create();

inventorytab = 0;
randomize();

itemConsumeMenu = false;
text_col = c_white;
text="";
cursor = -1;
partyCursor = 0;
partyCursorActive = false;
cursorLimit = 8;
consumingItem = 0;
usableItem = false;

box_x = 42;
box_y = 32;

#region PARTY MEMBERS LIST
ds_list_add(party, 0);
// ds_list_add(party, 1);
// ds_list_add(party, 2);
#endregion

#region SELECTED PARTY MEMBERS LIST
ds_list_add(selectedParty, 0);
// ds_list_add(selectedParty, 1);
// ds_list_add(selectedParty, 2);
#endregion

#region CONSUMABLES LIST
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
//ds_list_add(consumables, "Burger");
#endregion

#region KEY ITEMS LIST
//ds_list_add(keyitems, "Lost Bat");
//ds_list_add(keyitems, "A thing");
//ds_list_add(keyitems, "Dumb key");
#endregion
