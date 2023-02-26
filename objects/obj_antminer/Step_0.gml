
// play sound effect on sound emitter and particle effect
if (round(image_index) = 2 and counter<=0){
	audio_play_sound_on(pick_em, snd_pickaxe, false, 5);
	part_particles_create(global.partSystem, x-20, y-50, global.ptRubble, 4);
	counter=10;
}
else { counter-- };

// change dialogue for repeated interactions
if (textRpt = true){
	text = ["I've got mining to do.\nLeave me alone.",
			"Seems like he won't give us any more info on where we are.",
			"Unless...\nWe help him find what he's looking for.",
			"If we find any diamond, let's bring it to him. Okay?"];
	speakers = [id,kat,kat,kat];
	next_line = [0,0,0,0];
	scripts = [[port_swap, 0],[port_swap, 13],[port_swap, 3],-1];
}

