visible = false;
instance_deactivate_object(obj_player);

alarm[0] = -1;

voice = snd_typewriter;
name = "";
text = [
		"You grabbed your bike and headed out to work.",
		"...",
		"...",
		];
portrait_index = noone;
speakers = [id, id, id];
next_line = [0, 0, 0];
scripts = [[city_room_transition], -1,-1];