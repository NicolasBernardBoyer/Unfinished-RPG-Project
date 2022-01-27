// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_resolution(){

	switch(argument0){
		case 0: window_set_size(640,480); break;
		case 1: window_set_size(960,720); break;
		case 2: window_set_size(1280,960); break;
	}
}