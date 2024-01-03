
function approach(argument0, argument1, argument2){
/// approach(a, b, amount)
// Moves "a" towards "b" by "amount" and returns the result
// Nice bcause it will not overshoot "b", and works in both directions
// Examples:
//      speed = approach(speed, max_speed, acceleration);
//      hp = approach(hp, 0, damage_amount);
//      hp = approach(hp, max_hp, heal_amount);
//      x = approach(x, target_x, move_speed);
//      y = approach(y, target_y, move_speed);
 
if (argument0 < argument1)
{
    argument0 += argument2;
    if (argument0 > argument1)
        return argument1;
}
else
{
    argument0 -= argument2;
    if (argument0 < argument1)
        return argument1;
}
return argument0;
}