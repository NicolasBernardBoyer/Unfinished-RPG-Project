// slot variables
#macro INVENTORY_SLOTS 8
#macro KEY_ITEM_SLOTS 8
#macro SELECTED_PARTY_SLOTS 4
#macro PARTY_SLOTS 8
// row inventory and length
partyRowLength = 4;
inventoryRowLength = 2;

// create a list for each party tab
keyitems = ds_list_create();
party = ds_list_create();
selectedParty = ds_list_create();
consumables = ds_list_create();

// tab
inventorytab = 0;
randomize();

// seperate item menu for consuming stuff
itemConsumeMenu = false;

// text color and text
text_col = c_white;
text="";

// cursor variables
cursor = -1;
partyCursor = 0;
partyCursorActive = false;
cursorLimit = 8;

// item states
consumingItem = 0;
usableItem = false;

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
ds_list_add(selectedParty, 0);
// ds_list_add(selectedParty, 1);
// ds_list_add(selectedParty, 2);
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
