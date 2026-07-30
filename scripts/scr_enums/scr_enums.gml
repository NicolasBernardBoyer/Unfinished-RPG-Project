enum DIR {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

enum BattleState {
	BEGINNING,
	DRAW,
	PLAYER_MAIN,
	PLAYER_ATK,
	ENEMY_MAIN,
	ENEMY_ATK,
	REACTION,
	END
}

enum CardID {
	SHARPEN_CLAWS,
	UNCANNY_DODGE,
	PAW_OF_GREED
}