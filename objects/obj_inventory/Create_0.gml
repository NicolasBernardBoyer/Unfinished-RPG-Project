#macro INVENTORY_SLOTS 8
#macro KEY_ITEM_SLOTS 8
#macro PARTY_SLOTS 4
partyRowLength = 4;
inventoryRowLength = 2;
inventory = array_create(INVENTORY_SLOTS, 8);
keyitems = array_create(KEY_ITEM_SLOTS, 8);
party = array_create(PARTY_SLOTS, 4);
inventorytab = 0;
randomize();



#region PARTY MEMBERS LIST
party[0] = 0;
party[1] = -1;
party[2] = -1;
party[3] = -1;
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
inventory[8] = "Handburger";
#endregion

#region KEY ITEMS LIST
keyitems[0] = "Convenient Bat";
keyitems[1] = "A thing";
keyitems[2] = "Some dumb key";
keyitems[3] = -1;
keyitems[4] = -1;
keyitems[5] = -1;
keyitems[6] = -1;
keyitems[7] = -1;
keyitems[8] = -1;
#endregion

#region DEFINE KEYS
	global.PL = false; //LEFT
	global.PR = false; //RIGHT
	global.PU = false; //UP
	global.PD = false; //DOWN
	
	global.POK = false; //OK
	global.PCAN = false; //CANCEL (DELETE)
	
	global.HL = false; //HELD LEFT
	global.HR = false; //HELD RIGHT
	global.HU = false; //HELD UP
	global.HD = false; //HELD DOWN
	
	global.RL = false; //RELEASED LEFT
	global.RR = false; //RELEASED RIGHT
	global.RU = false; //RELEASED UP
	global.RD = false; //RELEASED DOWN
	
	global.PSEL = false;
#endregion
