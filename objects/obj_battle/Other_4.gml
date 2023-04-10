instance_deactivate_all(true);
instance_activate_object(obj_battle_depthsorter);
instance_activate_object(camera);

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];

//Make allies
for (var i = 0; i < array_length(enemies); i++)
{
	// go back to shawn's video for info on specific rows
	enemyUnits[i] = instance_create_layer(room_width/2+128, y+120+(i*50), "Instances", obj_battle_unit_enemy, enemies[i]);
	array_push(units, enemyUnits[i]);
}

//Make party
for (var i = 0; i < array_length(global.party); i++)
{
	partyUnits[i] = instance_create_layer(room_width/2-128, y+120+(i*50), "Instances", obj_battle_unit_pc, global.party[i]);
	array_push(units, partyUnits[i]);
}

//Determine turn order
array_copy(unitTurnOrder, 0, units, 0, array_length(units));

//bubble sort the contents of array based off agility
var n = array_length(unitTurnOrder);
for (var i = 0; i < n - 1; i++){
	for (var j = 0; j < n - i - 1; j++){
		if (unitTurnOrder[j].agility > unitTurnOrder[j+1].agility){
			temp = unitTurnOrder[j];
			unitTurnOrder[j] = unitTurnOrder[j+1];
			unitTurnOrder[j+1] = temp;
		}
	}
}

//Get render order
refresh_render_order = function(){
	unitRenderOrder = [];
	array_copy(unitRenderOrder,0,units,0,array_length(units));
	array_sort(unitRenderOrder, function(_1, _2){
		return _1.y - _2.y;
	});
}
refresh_render_order();

create_textbox(text, speakers, next_line, scripts);
obj_textbox.proceed = false;