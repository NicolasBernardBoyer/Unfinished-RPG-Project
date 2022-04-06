#macro INVENTORY_SLOTS 8
#macro KEY_ITEM_SLOTS 8
#macro SELECTED_PARTY_SLOTS 4
#macro PARTY_SLOTS 8
partyRowLength = 4;
inventoryRowLength = 2;
inventory = array_create(INVENTORY_SLOTS, 8);
keyitems = array_create(KEY_ITEM_SLOTS, 8);
party = array_create(PARTY_SLOTS, 8);
selectedParty = array_create(SELECTED_PARTY_SLOTS, 4);
inventorytab = 0;
randomize();

text="";

memberSelected = true;
cursor = -1;
cursorLimit = 8;

box_x = 42;
box_y = 32;


#region PARTY MEMBERS LIST
party[0] = 0;
party[1] = 1;
party[2] = 2;
party[3] = -1;
party[4] = -1;
party[5] = -1;
party[6] = -1;
party[7] = -1;
#endregion

#region SELECTED PARTY MEMBERS LIST
selectedParty[0] = 0;
selectedParty[1] = 1;
selectedParty[2] = 2;
selectedParty[3] = -1;
#endregion

#region CONSUMABLES LIST
inventory[0] = "Handborger";
inventory[1] = "Handburgar";
inventory[2] = "Burger";
inventory[3] = "Handbuhrger";
inventory[4] = "Borgar";
inventory[5] = "MMBorguar";
inventory[6] = "Burghuer";
inventory[7] = "Buregueur";
#endregion

#region KEY ITEMS LIST
keyitems[0] = "Lost Bat";
keyitems[1] = "A thing";
keyitems[2] = "Dumb key";
keyitems[3] = -1;
keyitems[4] = -1;
keyitems[5] = -1;
keyitems[6] = -1;
keyitems[7] = -1;
#endregion
