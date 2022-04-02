if(global.PR and inventorytab < 2){
	inventorytab++;
} else if (global.PR and inventorytab >= 2){
	inventorytab = 0;
}

if(global.PL and inventorytab > 0){
	inventorytab--;
} else if (global.PL and inventorytab <= 0){
	inventorytab = 2;
}

