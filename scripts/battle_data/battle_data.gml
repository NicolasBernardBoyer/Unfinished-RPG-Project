
global.player_data = {
	hp : 100,
	atk : 10,
	moves : {
		attack : function(_atk, _target) {
			
		},
		
	}
};

global.test_enemy_data = {
	hp : 100,
	atk : 10
};

global.battle_coords = {
	player_x : 141,
	player_y : 237,
	
	enemy1_x : 493,
	enemy1_y : 237,
	
	enemy2_x : 527,
	enemy2_y : 274,
	
	enemy3_x : 527,
	enemy3_y : 200
};

function battle() constructor {	
	turn = 0;
	units = ds_list_create();
	for (var i = 0; i < argument_count; i++){
		ds_list_add(units, argument[i]);
	}
	create_units = function(_list) {
		instance_create_layer(global.battle_coords.player_x, global.battle_coords.player_y, "Instances", obj_player_battler, global.player_data);
		switch (ds_list_size(_list)) {
			case 1:
				// Execute win, only player left
				show_debug_message("Player has won");
				break;
			case 2:
				show_debug_message("Creating 2 units");
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				break;
			case 3:
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy2_x, global.battle_coords.enemy2_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				break;
			case 4:
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy2_x, global.battle_coords.enemy2_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy3_x, global.battle_coords.enemy3_y, "Instances", obj_enemy_battler, global.test_enemy_data);
				break;
			default:
				show_debug_message("Amount of units not valid to start a battle");
		}
	}
	function execute_turn() {
		has_turn = ds_list_find_value(units, turn);
		if (has_turn == obj_player_battler) {
			
		} else if (has_turn == obj_enemy_battler){
			
		}
	}
	
	execute_turn();
	create_units(units);
}
