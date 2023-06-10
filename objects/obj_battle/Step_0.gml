battleState();
input_handler();

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