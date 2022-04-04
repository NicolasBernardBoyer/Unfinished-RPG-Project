if (inventorytab == 0){
	draw_sprite(spr_arrow, 0, 42, 116);
} else if (inventorytab == 1){
	draw_sprite(spr_arrow, 0, 134, 116);
} else if (inventorytab == 2){
	draw_sprite(spr_arrow, 0, 242, 116);
}

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

