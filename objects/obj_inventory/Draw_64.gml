draw_sprite_stretched
(
	/* sprite */spr_box,
	/* frame */0,
	/* x */ 42,
	/* y */ 32,
	/* width */global.game_width-88,
	/* height */global.game_height-64
);

// DRAW CHANGING TABS
if (inventorytab == 0){
	draw_sprite(spr_inventory_tabs, 0, 42, 106);
} else if (inventorytab == 1) {
	draw_sprite(spr_inventory_tabs, 1, 42, 106);
} else if (inventorytab == 2) {
	draw_sprite(spr_inventory_tabs, 2, 42, 106);
}

// DRAW TEXT
/*for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
	var xx = 32 + (i mod rowLength)*64;
	var yy = 32 + (i div rowLength)*64;
	draw_sprite_stretched(spr_box,0,xx,yy,64,64);
	if (inventory[i] != -1)
	{
		draw_sprite(spr_dragon_plush, inventory[i],xx,yy);
	}
}*/

// DRAW PARTY
for (var i = 0; i < PARTY_SLOTS; i += 1)
{
	var xx = 42 + (i mod rowLength)*74;
	var yy = 32 + (i div rowLength)*74;
	draw_sprite_stretched(spr_box_empty,0,xx,yy,74,74);
	if (party[i] != -1)
	{
		draw_sprite(spr_party_faces, party[i],xx+1,yy+1);
	}
}
	