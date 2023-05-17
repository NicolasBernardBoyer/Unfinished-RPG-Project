battleState();
// check if current turn unit has moved forward yet
if (unitTurnOrder[turn].x <= partyTurnPos) unitTurnOrder[turn].x = Approach(unitTurnOrder[turn].x, partyTurnPos, 2);
if (!instance_exists(obj_battle_menu) and unitTurnOrder[turn].x >= partyTurnPos){
	// Create menu box based off unit's current turn
	instance_create_depth(menuBoxX, menuBoxY, depth-10, obj_battle_menu);
}

for (var i = 0; i < array_length(partyUnits); i++){
	with (partyUnits[i]){
		if (visualhp != hp){
			visualhp = Approach(visualhp, hp, 1);
		}
		if (visualmp != mp){
			visualmp = Approach(visualmp, mp, 1);
		}
	}
}