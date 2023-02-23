// Normal collision rectangle code
var inst = collision_rectangle(x-radiusX, y-radiusY, x+radiusX, y+radiusY, obj_player, false, true);
if (inst!=noone){
	if (runOnce == false){
		// Run the cutscene
		if (!instance_exists(obj_textbox)) {
			global.highbox = true;
			create_textbox(text, speakers, next_line, scripts);
			runOnce = true;
		}
	}
} else if (!place_meeting(x,y,obj_player)){
	runOnce = false;
}






