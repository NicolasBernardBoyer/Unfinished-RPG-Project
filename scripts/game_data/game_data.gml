global.action_library = {
	attack :
	{
		name : "Attack",
		description : "{0} attacks!",
		sub_menu : -1,
		target_required : true,
		target_enemy_by_default : true,
		target_all : MODE.NEVER,
		user_animation : "attack",
		effect_sprite : spr_bubble_shield,
		effect_on_target : MODE.ALWAYS,
		func : function(_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			with (_targets[0]) hp = max(0, hp - _damage);
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
		actions : []
	}
	,
	{
		name: "TestGirl",
		hp: 14,
		hp_max: 89,
		mp: 10,
		mp_max: 15,
		strength: 6,
		sprites : { idle: spr_testgirl, attack: spr_testgirl_attack, defend: spr_testgirl_attack, down: spr_testgirl_down},
		actions : []
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
		actions: [],
		xp_value: 15,
		AIscript : function()
		{
			// enemy turn ai does here
		}
	},
}