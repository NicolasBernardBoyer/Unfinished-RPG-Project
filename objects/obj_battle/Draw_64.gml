draw_sprite(spr_dominationbar,0,10,10);

if (instance_exists(obj_battle_unit_pc)){
	for (var i = 0; i < array_length(global.party); i++){
		draw_sprite(global.party[i].stat_box, 0, x+(i*128), y+296);
		draw_sprite(spr_heart_container, 0, x+58+(i*128), y+308);
		draw_sprite(spr_spicon, 0, x+58+(i*128), y+328);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(fnt_vcr);
		draw_text(x+79+(i*128), y+304, global.party[i].hp);
		draw_text(x+79+(i*128), y+324, global.party[i].mp);
		draw_set_font(fnt_8bit);
	}
}

//if (instance_exists(obj_battle_unit_enemy)){
//	for (var i = 0; i < array_length(enemies); i++){
//		draw_sprite(spr_hpbar, 0, 50, 50);
//	}
//}
