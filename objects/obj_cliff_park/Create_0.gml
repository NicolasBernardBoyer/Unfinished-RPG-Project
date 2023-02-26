// cutscene variables
cliffBreak = false;
dropOff = false;
dropSpeed = 0;

// get animation curve
curve = animcurve_get_channel(ac_accelDrop,0);

alarm[0] = -1;

hasText = false;

voice = snd_typewriter;
name = "";

text[0] = "";
portrait_index = noone;
speakers = [id];
next_line = [0];
scripts = [-1];
