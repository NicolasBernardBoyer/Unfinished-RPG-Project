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
			BattleChangeHP(_targets[0], -_damage, 0);
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
		hpMax: 90,
		mp: 15,
		visualmp : 15,
		mpMax: 15,
		strength: 6,
		defense: 4,
		agility: 6,
		luck: 8,
		stat_box: spr_stat_player,
		sprites: { idle: spr_player_idle, down: spr_player_faint},
		actions: []
	}
	,
	{
		name: "Katarina",
		unittype: "ally",
		hp: 70,
		visualhp : 70,
		hpMax: 70,
		mp: 15,
		visualmp: 15,
		mpMax: 15,
		strength: 12,
		defense: 2,
		agility: 12,
		luck: 1,
		stat_box: spr_stat_kat,
		sprites: { idle: spr_kat_idle, down: spr_kat_faint},
		actions: []
	}
];

// Enemy Data
global.enemies = {
	saveGuy:
	{
		name: "Save Guy",
		unittype: "enemy",
		hp: 30,
		hpMax: 30,
		mp: 0,
		mpMax: 0,
		strength: 1,
		defense: 1,
		agility: 1,
		luck: 1,
		sprites: { idle: spr_save_guy_idle },
		actions: [],
		xpValue : 15,
		AIscript : function()
		{
			//enemy turn ai goes here
		}
	}
}
