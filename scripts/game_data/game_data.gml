// party data
global.party = 
[
	{
		name: "TestGuy",
		hp: 90,
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
		hp: 90,
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