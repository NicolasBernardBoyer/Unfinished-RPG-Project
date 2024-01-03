// Normal collision rectangle code
var inst = collision_rectangle(x-radius_x, y-radius_y, x+radius_x, y+radius_y, obj_player, false, true);
if (inst!=noone){
	if (run_once == false){
		// Run the cutscene
		if (!instance_exists(obj_textbox)) {
			global.highbox = true;
			create_textbox(text, speakers, next_line, scripts);
			run_once = true;
		}
	}
} else if (!place_meeting(x,y,obj_player)){
	run_once = false;
}






