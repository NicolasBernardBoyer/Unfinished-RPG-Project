#region Particle Type

//Basic Particle
var _p = part_type_create();

part_type_sprite(_p, spr_player_leftwalk, true, true, false);
part_type_life(_p, 20, 40);

part_type_speed(_p, 2, 4, 0, 0);
part_type_direction(_p, 0, 360, 0, 0);
part_type_orientation(_p, 0, 0, 0, 0, true);

part_type_size(_p, 0, 0, 0.04, 0);

global.ptBasic = _p;

// Trail Particle
var _p = part_type_create();

part_type_shape(_p, pt_shape_circle);
part_type_life(_p, 40, 50);
part_type_size(_p, 0.4, 0.4, -0.02, 0.05);

global.ptTrail = _p;

// Set as step
part_type_step(global.ptBasic, 1, global.ptTrail);

// Death explosion
var _p = part_type_create();

part_type_shape(_p, pt_shape_flare);
part_type_life(_p, 30, 40);
part_type_size(_p, 0.3, 0.4, 0.08, 0);
part_type_alpha3(_p, 0.8, 1, 0);
part_type_blend(_p, true);

global.ptDeathExplosion = _p;

//Set as death
part_type_death(global.ptBasic, 1, global.ptDeathExplosion);

#endregion