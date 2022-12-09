
if (round(image_index) = 2 and counter<=0){
	audio_play_sound_on(pick_em, snd_pickaxe, false, 5);
	part_particles_create(global.partSystem, 254, 137, global.ptRubble, 4);
	counter=10;
}
else { counter-- };



