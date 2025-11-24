

global.player_data = {
	hp : 100,
	atk : 10,
	moves : {
		attack : function(_atk, _target) {
			_target.hp -= _atk * 1;
			var _psys = part_system_create(p_hit_effect);
			part_system_position(_psys, _target.x, _target.y);
		},
	}
};

global.test_enemy_data = {
	hp : 100,
	atk : 10,
	moves : {
		attack : function(_atk, _target) {
			_target.hp -= _atk * 1;
			var _psys = part_system_create(p_hit_effect);
			part_system_position(_psys, _target.x, _target.y);
		},
	}
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
		instance_create_layer(global.battle_coords.player_x, global.battle_coords.player_y, "Instances", ds_list_find_value(_list, 0), global.player_data);
		switch (ds_list_size(_list)) {
			case 1:
				// Execute win, only player left
				show_debug_message("Player has won");
				break;
			case 2:
				show_debug_message("Creating 2 units");
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", ds_list_find_value(_list, 1), global.test_enemy_data);
				break;
			case 3:
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", ds_list_find_value(_list, 1), global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy2_x, global.battle_coords.enemy2_y, "Instances", ds_list_find_value(_list, 2), global.test_enemy_data);
				break;
			case 4:
				instance_create_layer(global.battle_coords.enemy1_x, global.battle_coords.enemy1_y, "Instances", ds_list_find_value(_list, 1), global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy2_x, global.battle_coords.enemy2_y, "Instances", ds_list_find_value(_list, 2), global.test_enemy_data);
				instance_create_layer(global.battle_coords.enemy3_x, global.battle_coords.enemy3_y, "Instances", ds_list_find_value(_list, 3), global.test_enemy_data);
				break;
			default:
				show_debug_message("Amount of units not valid to start a battle");
		}
	}
	function execute_turn(_units, _turn) {
		var has_turn = ds_list_find_value(_units, _turn);
		if (has_turn == obj_player_battler) {
			// create a menu and let player select
			global.player_data.moves.attack(10, ds_list_find_value(_units, 1));
		} else if (has_turn == obj_enemy_battler){
			// run specific enemy AI function here
			global.test_enemy_data.moves.attack(10, ds_list_find_value(_units, 0));
		}
	}

	create_units(units);
	execute_turn(units, turn);
}
