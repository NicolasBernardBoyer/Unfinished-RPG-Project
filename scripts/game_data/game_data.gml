enum MODE
{
	NEVER = 0,
	ALWAYS = 1,
	VARIES = 2
}

// Action Library
global.actionLibrary = 
{
	attack :
	{
		name : "Attack",
		description : "{0} attacks!",
		subMenu : -1,
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : spr_glassParticle,
		effectOnTarget : MODE.ALWAYS,
		func : function (_user, _targets)
		{
			var _damage = ceil(_user.strength + random_range(-_user.strength * 0.25, _user.strength * 0.25));
			battle_change_hp(_targets[0], -_damage, 0);
		}
	},
	food :
	{
		name : "Food",
		description : "{0} attacks!",
		subMenu : "Item",
		targetRequired : true,
		targetEnemyByDefault : true,
		targetAll : MODE.NEVER,
		userAnimation: "attack",
		effectSprite : spr_glassParticle,
		effectOnTarget : MODE.ALWAYS,
		func: function (_user, _targets)
		{
			var _heal = 10;
			battle_change_hp(_targets[0], -_heal, 0);
		}
	},
	moonerang : 
	{
		name : "Moonerang",
		description : "{0} throws a moonerang!",
		subMenu : "Magic",
		targetRequired: true,
		targetEnemyByDefault: true, //0: party/self, 1: enemy
		targetAll : MODE.NEVER,
		userAnimation : "attack",
		effectSprite : spr_glassParticle,
		effectOnTarget : MODE.ALWAYS,
		func: function(_user, _targets)
		{
			var _damage = irandom_range(10,15);
			battle_change_hp(_targets[0], -_damage);
			//BattleChangeMP(_user, -mpCost)
		}
	}
}

// Party member data
global.party = 
[
	{
		name: "You",
		unittype: "ally",
		hp: 90,
		visualhp : 90,
		hp_max: 90,
		mp: 15,
		visualmp : 15,
		mpMax: 15,
		strength: 6,
		defense: 4,
		agility: 6,
		luck: 8,
		stat_box: spr_stat_player,
		sprites: { idle: spr_player_idle, DOWN: spr_player_faint, walk: undefined },
		actions: [global.actionLibrary.attack, global.actionLibrary.food]
	}
	,
	{
		name: "Katarina",
		unittype: "ally",
		hp: 70,
		visualhp : 70,
		hp_max: 70,
		mp: 15,
		visualmp: 15,
		mpMax: 15,
		strength: 12,
		defense: 2,
		agility: 12,
		luck: 1,
		stat_box: spr_stat_kat,
		sprites: { idle: spr_kat_idle, DOWN: spr_kat_faint, walk: spr_kat_bwalk },
		actions: [global.actionLibrary.moonerang]
	}
];

// Enemy Data
global.enemies = {
	saveGuy:
	{
		name: "Save Guy",
		unittype: "enemy",
		hp: 200,
		hp_max: 200,
		mp: 0,
		mpMax: 0,
		strength: 1,
		defense: 1,
		agility: 1,
		luck: 1,
		sprites: { idle: spr_save_guy_idle },
		actions: [global.actionLibrary.attack],
		xpValue : 15,
		AIscript : function()
		{
			//enemy turn ai goes here
			//attack random party member
			var _action = actions[0];
			var _possibleTargets = array_filter(obj_battle.partyUnits, function(_unit, _index)
			{
				return (_unit.hp > 0);
			});
			var _target = _possibleTargets[irandom(array_length(_possibleTargets)-1)];
			return [_action, _target];
		}
	}
}
