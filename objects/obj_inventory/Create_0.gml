#macro INVENTORY_SLOTS 16
#macro KEY_ITEM_SLOTS 16
#macro PARTY_SLOTS 4
rowLength = 4;
inventory = array_create(INVENTORY_SLOTS, 16);
keyitems = array_create(KEY_ITEM_SLOTS, 16);
party = array_create(PARTY_SLOTS, 4);
inventorytab = 0;
randomize();

#region PARTY MEMBERS LIST
party[0] = 0;
party[1] = 1;
party[2] = -1;
party[3] = -1;
#endregion

#region INVENTORY SLOTS LIST
inventory[0] = -1;
inventory[1] = -1;
inventory[3] = -1;
inventory[4] = -1;
inventory[5] = -1;
inventory[6] = -1;
inventory[7] = -1;
inventory[8] = -1;
inventory[9] = -1;
inventory[10] = -1;
inventory[11] = -1;
inventory[12] = -1;
inventory[13] = -1;
inventory[14] = -1;
inventory[15] = -1;
inventory[16] = -1;
#endregion

#region KEY ITEMS LIST
keyitems[0] = -1;
keyitems[1] = -1;
keyitems[2] = -1;
keyitems[3] = -1;
keyitems[4] = -1;
keyitems[5] = -1;
keyitems[6] = -1;
keyitems[7] = -1;
keyitems[8] = -1;
keyitems[9] = -1;
keyitems[10] = -1;
keyitems[11] = -1;
keyitems[12] = -1;
keyitems[13] = -1;
keyitems[14] = -1;
keyitems[15] = -1;
keyitems[16] = -1;
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
