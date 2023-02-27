// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Chance(){
	/// @description Chance(percent)
	/// @param percent
 
	// Returns true or false depending on RNG
	// ex: 
	//      Chance(0.7);    -> Returns true 70% of the time
	
	return argument0 > random(1);
}