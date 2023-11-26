//draw_sprite(spr_dominationbar,0,10,10);

#macro STAT_BOX 128


if (instance_exists(obj_battle_unit_pc)){
	for (var i = 0; i < array_length(global.party); i++){
		// Draw stat box and icons
		draw_sprite(global.party[i].stat_box, 0, x+(i*STAT_BOX), y+296);
		draw_sprite(spr_heart_container, 0, x+58+(i*STAT_BOX), y+308);
		draw_sprite(spr_spicon, 0, x+58+(i*STAT_BOX), y+328);
		// draw stats text
		draw_set_valign(fa_top);
		draw_set_halign(fa_LEFT);
		draw_set_font(fnt_vcr);
		// (color will be yellow if hp/mp is at max)
		if (partyUnits[i].visualhp = partyUnits[i].hp_max) draw_set_color(c_yellow);
		draw_text(x+79+(i*STAT_BOX), y+304, partyUnits[i].visualhp);
		draw_set_color(c_white);
		
		if (partyUnits[i].visualmp = partyUnits[i].mpMax) draw_set_color(c_yellow);
		draw_text(x+79+(i*STAT_BOX), y+324, partyUnits[i].visualmp);
		draw_set_color(c_white);
		
		draw_set_font(fnt_8bit);
	}
}
