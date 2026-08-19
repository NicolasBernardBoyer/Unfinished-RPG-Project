global.action_library = {
	attack :
	{
		name : "Attack",
		description : "{0} attacks!",
		submenu : -1,
		target_required : true,
		target_enemy_by_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : spr_bubble_shield,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			battle_change_hp(_targets[0], -_damage, 0);
		}
	},
	ice :
	{
		name : "Ice",
		description : "{0} casts Ice!",
		submenu : "Magic",
		mp_cost : 4,
		target_required: true,
		target_enemy_by_default: true, //0: party/self, 1: enemy
		target_all: MODE.VARIES,
		user_animation : "cast",
		effect_sprite: spr_bubble_shield_break,
		effect_on_target: MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = irandom_range(10,15);
			battle_change_hp(_targets[0], -_damage);
		}
	},
	hp_potion :
	{
		name: "HP Potion",
		description: "{0} used an HP Potion!",
		submenu : "Items",
		target_required : true,
		target_enemy_by_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : spr_exclamation_mark,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _healing = 20;
			battle_change_hp(_targets[0], _healing);
			use_item(self);
		}
	}
}

enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

// party data
global.party = 
[
	{
		name: "TestGuy",
		hp: 89,
		hp_max: 89,
		mp: 10,
		mp_max: 15,
		strength: 6,
		sprites : { idle: spr_testguy, attack: spr_testguy_attack, defend: spr_testguy_attack, down: spr_testguy_down},
		actions : [global.action_library.attack, global.action_library.hp_potion, global.action_library.hp_potion]
	}
	,
	{
		name: "TestGirl",
		hp: 89,
		hp_max: 89,
		mp: 10,
		mp_max: 15,
		strength: 6,
		sprites : { idle: spr_testgirl, attack: spr_testgirl_attack, defend: spr_testgirl_attack, down: spr_testgirl_down},
		actions : [global.action_library.attack, global.action_library.ice, global.action_library.hp_potion, global.action_library.hp_potion]
	}
];

// enemy data
global.enemies = 
{
	test_slime:
	{
		name: "Slime",
		hp: 30,
		hp_max: 30,
		mp: 0,
		mp_max: 0,
		strength: 5,
		sprites: { idle: spr_slime, attack: spr_slime_attack},
		actions: [global.action_library.attack],
		xp_value: 15,
		ai_script : function()
		{
			var _action = actions[0];
			var _possible_targets = array_filter(obj_battle.party_units, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possible_targets[irandom(array_length(_possible_targets)-1)];
			return[_action, _target];
		}
	},
}