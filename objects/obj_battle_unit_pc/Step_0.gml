event_inherited();
if (hp <= 0)
{
	sprite_index = sprites.DOWN;
}
else
{
	if (sprite_index == sprites.DOWN) sprite_index = sprites.idle;
}