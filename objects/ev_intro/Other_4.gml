if (global.playintro == false) {
	goto_room(global.previousRoom);
}
if (alarm[0] == -1){
	alarm[0] = 60;
}