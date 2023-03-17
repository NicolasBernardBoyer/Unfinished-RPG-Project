instance_deactivate_all(true);
instance_activate_object(obj_battle_depthsorter);
instance_activate_object(camera);

with (camera) {
	camWidth = 480;
	camHeight = 256;
}

units = [];

//Make allies
for (var i = 0; i < array_length(enemies); i++)
{
	// go back to shawn's video for info on specific rows
	enemyUnits[i] = instance_create_layer(room_width/2+(i*20), y+68+(i*20), "Instances", obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

//Make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_layer(room_width/2-70-(i*30), y+100+(i*25), "Instances", obj_battle_unit_pc, global.party[i]);
	array_push(units, partyUnits[i]);
}