
if (round(image_index) = 2 and counter<=0){
	audio_play_sound_on(pick_em, snd_pickaxe, false, 5);
	part_particles_create(global.partSystem, x-20, y-50, global.ptRubble, 4);
	counter=10;
}
else { counter-- };

if (textRpt = true){
	text = ["I've got mining to do.\nLeave me alone."];
	speakers = [id];
	next_line = [0];
	scripts = -1;
}

