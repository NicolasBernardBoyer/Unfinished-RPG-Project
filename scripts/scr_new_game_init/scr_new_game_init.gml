function scr_new_game_init(){
	global.money = 100;
    global.player_name = "New Person";
    global.previous_room = rm_yourbedroom;
    global.target_x = 0;
    global.target_y = 0;
    global.has_coat = false;
    global.has_backpack = false;
    global.playintro = true;
    
    // Reset UI state cleanly
    global.pause = false;
    global.in_battle = false;
    global.inventory_open = false;
    global.can_pause = true;
}	