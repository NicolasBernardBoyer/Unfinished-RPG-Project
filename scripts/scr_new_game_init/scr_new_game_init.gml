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
    
    // Initialize your deck here too
    if (ds_exists(global.deck, ds_type_list)) ds_list_destroy(global.deck);
	if (ds_exists(global.hand, ds_type_list)) ds_list_destroy(global.hand);
	if (ds_exists(global.discard, ds_type_list)) ds_list_destroy(global.discard);
	
    global.deck = ds_list_create();
	global.player_power = 5;
	global.player_damage = 0;
	global.player_cost = 0;
	
    add_cards(global.deck, Card_SharpenClaws(), 4);
	add_cards(global.deck, Card_UncannyDodge(), 4);
	add_cards(global.deck, Card_PawOfGreed(), 3);
}	