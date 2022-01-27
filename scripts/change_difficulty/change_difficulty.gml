// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_difficulty(){
	var type = menu_option[page];
	
	if (type == 0) {
		switch(argument0){
			case 0:
				//easy
			break;
			
			case 1:
				//normal
			break;
			
			case 2:
				//hard
			break;
		}
	}
}