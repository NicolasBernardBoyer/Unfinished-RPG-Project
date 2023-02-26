// if you can run the animation, make the animation play
if (runAnim = true){
	image_speed = 1;
}
// once animation is done, freeze on last frame
if (image_index = 7){
	runAnim = false;
	image_speed = 0;
}