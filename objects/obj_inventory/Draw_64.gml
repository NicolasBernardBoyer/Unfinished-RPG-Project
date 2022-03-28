draw_sprite_stretched
(
	/* sprite */spr_box,
	/* frame */0,
	/* x */ 32,
	/* y */ 32,
	/* width */global.game_width-64,
	/* height */global.game_height-64
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
	var xx = 32 + (i mod rowLength)*64;
	var yy = 32 + (i div rowLength)*64;
	draw_sprite_stretched(spr_box,0,xx,yy,64,64);
	if (inventory[i] != -1)
	{
		draw_sprite(spr_dragon_plush, inventory[i],xx,yy);
	}
}
	