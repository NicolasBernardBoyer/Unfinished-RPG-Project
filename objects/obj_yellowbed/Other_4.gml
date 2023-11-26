// only play the intro the first time this scene loads in
if (global.playintro == true){
	global.playintro = false;
}

// stop player from pausing and run the first alarm
if (runAlarm){
	global.can_pause = false;
	alarm[0] = 120;
}