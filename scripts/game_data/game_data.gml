// Party member data
global.party = 
[
	{
		name: "You",
		hp: 90,
		hpMax: 90,
		mp: 10,
		mpMax: 15,
		strength: 6,
		sprites: { idle: spr_player_idle },
		actions: []
	}
	,
	{
		name: "Katarina",
		hp: 70,
		hpMax: 70,
		mp: 10,
		mpMax: 15,
		strength: 12,
		sprites: { idle: spr_kat_idle },
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
		strength: 5,
		sprites: { idle: spr_save_guy },
		actions: [],
		xpValue : 15,
		AIscript : function()
		{
			//enemy turn ai goes here
		}
	}
}
