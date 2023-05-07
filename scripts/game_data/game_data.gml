// Party member data
global.party = 
[
	{
		name: "You",
		hp: 90,
		hpMax: 90,
		mp: 15,
		mpMax: 15,
		strength: 6,
		defense: 4,
		agility: 6,
		luck: 8,
		stat_box: spr_stat_player,
		sprites: { idle: spr_player_idle, },
		actions: []
	}
	,
	{
		name: "Katarina",
		hp: 70,
		hpMax: 70,
		mp: 15,
		mpMax: 15,
		strength: 12,
		defense: 2,
		agility: 12,
		luck: 1,
		stat_box: spr_stat_kat,
		sprites: { idle: spr_kat_idle, },
		actions: []
	}
];

// Enemy Data
global.enemies = {
	saveGuy:
	{
		name: "Save Guy",
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
