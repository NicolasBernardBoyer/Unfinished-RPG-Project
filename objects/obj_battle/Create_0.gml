instance_deactivate_all(true);

units = [];

//Make enemies
for (var i = 0; i < array_length(enemies); i++)
{
	// change values to match that of lanes later
	enemy_units[i] = instance_create_depth(x+230+(i*10), y+80+(i*20), depth-10, obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemy_units[i]);
}

//Make party
for (var i = 0; i < array_length(global.party); i++)
{
	// change values to match that of lanes later
	party_units[i] = instance_create_depth(x+70+(i*10), y+80+(i*15), depth-10, obj_battle_unit_pc, global.party[i]);
	array_push(units, party_units[i]);
}

