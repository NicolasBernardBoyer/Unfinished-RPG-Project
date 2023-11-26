function new_encounter(this_enemies, background){
	instance_create_depth
	(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		-9999,
		obj_battle,
		{ enemies: this_enemies, creator: id, battle_background: background }
	);
}

function battle_change_hp(target, amount, alive_dead_or_either = 0)
{
	//_AliveDeadOrEither: 0 = alive only, 1 = dead only, 2 = any
	var failed = false;
	if (alive_dead_or_either == 0) && (target.hp <= 0) failed = true;
	if (alive_dead_or_either == 1) && (target.hp > 0) failed = true;
	
	var col = c_white;
	if (amount > 0) col = c_lime;
	if (failed)
	{
		col = c_white;
		amount = "failed";
	}
	instance_create_depth
	(
		target.x+20,
		target.y-50,
		target.depth-1,
		obj_battle_floating_text,
		{ font: fnt_small, col: col, text: string(-(amount))}
	);
	if (!failed) target.hp = clamp(target.hp + amount, 0, target.hp_max);
	
}
