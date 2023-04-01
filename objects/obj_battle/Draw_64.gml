draw_sprite(spr_dominationbar,0,10,10);

if (instance_exists(obj_battle_unit_pc)){
	for (var i = 0; i < array_length(global.party); i++){
		draw_sprite(spr_hpbar, 0, 50, 50);
	}
}

if (instance_exists(obj_battle_unit_enemy)){
	for (var i = 0; i < array_length(enemies); i++){
		draw_sprite(spr_hpbar, 0, 50, 50);
	}
}