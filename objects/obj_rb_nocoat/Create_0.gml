instance_deactivate_object(inst_740548B5);

voice = snd_typewriter;
name = "";
text = ["It's cold outside. You should take your coat from the coatrack."];
portrait_index = noone;
speakers = [id];
next_line = [0];
scripts = [[change_variable, id, "moveplayer", true]];

radius_x = 8;
radius_y = 32;
run_once = false;

alarm[0] = -1;
moveplayer = false;