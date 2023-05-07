//Draw background art
draw_sprite(battleBackground,0,x,y);

// Draw units in depth order
var _unitWithCurrentTurn = unitTurnOrder[turn].id;
for (var i = 0; i < array_length(unitRenderOrder); i++)
{
	with (unitRenderOrder[i]){
		draw_self();
	}
}


