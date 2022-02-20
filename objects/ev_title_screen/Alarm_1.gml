instance_activate_object(obj_player);
if (global.playintro){
	room_goto(rm_intro);
} else {
	room_goto(global.previousRoom);
}