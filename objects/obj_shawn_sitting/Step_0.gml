// if you can run the animation, make the animation play
if (run_anim = true){
	image_speed = 1;
}
// once animation is done, freeze on last frame
if (image_index = 7){
	run_anim = false;
	image_speed = 0;
}