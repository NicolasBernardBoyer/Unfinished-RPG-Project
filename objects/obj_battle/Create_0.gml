instance_deactivate_all(true);
instance_activate_object(camera);

units = [];
turn = 0;
unitTurnOrder = [];
unitRenderOrder = [];

eXOffset	= 480;
eXCharSpace = 20;
eYOffset	= 190;
eYCharSpace = 75;

pXOffset	= 160;
pXCharSpace = 20;
pYOffset	= 190;
pYCharSpace = 75;



//Make allies
for (var i = 0; i < array_length(enemies); i++)
{
	// go back to shawn's video for info on specific rows
	if (i != 2) {
		enemyUnits[i] = instance_create_depth(x+480-(i*eXCharSpace), y+eYOffset+(i*75), depth-10, obj_battle_unit_enemy, enemies[i]);
	} else {
		enemyUnits[i] = instance_create_depth(x+520, y+eYOffset+((i-1)*38), depth-10, obj_battle_unit_enemy, enemies[i]);
	}
	array_push(units, enemyUnits[i]);
}

//Make party
for (var i = 0; i < array_length(global.party); i++)
{
	if (i != 2){
		partyUnits[i] = instance_create_depth(x+160-(i*pXCharSpace), y+pYOffset+(i*70), depth-10, obj_battle_unit_pc, global.party[i]);
	} else {
		partyUnits[i] = instance_create_depth(x+80, y+pYOffset+((i-1)*38), depth-10, obj_battle_unit_pc, global.party[i]);
	}
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

voice = snd_typewriter;
name = "";
text = ["This is a test box"];
portrait_index = noone;
speakers = [id];
next_line = [0];
scripts = [-1];

global.highbox = true;
create_textbox(text, speakers, next_line, scripts);




