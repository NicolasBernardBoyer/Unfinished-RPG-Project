// cutscene variables
cliff_break = false;
drop_off = false;
drop_speed = 0;

// get animation curve
curve = animcurve_get_channel(ac_accel_drop,0);

alarm[0] = -1;

has_text = false;

voice = snd_typewriter;
name = "";

text[0] = "";
portrait_index = noone;
speakers = [id];
next_line = [0];
scripts = [-1];
