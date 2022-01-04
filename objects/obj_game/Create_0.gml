global.inventoryOpen = false;
global.inBattle = false;
global.playerName = "New Kid";
global.hasBackpack = false;

global.game_width = 384;
global.game_height = 288;

blackAlpha = 0;

spawnRoom = -1;
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false;



enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

display_set_gui_size(global.game_width, global.game_height);