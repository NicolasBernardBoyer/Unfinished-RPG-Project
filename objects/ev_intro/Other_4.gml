// If intro isn't playing then send the player to their room automatically
if (global.playintro == false) {
	goto_room();
}
if (alarm[0] == -1){
	alarm[0] = 60;
}