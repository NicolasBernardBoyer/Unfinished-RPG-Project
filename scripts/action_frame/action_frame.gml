
/// @arg value
function action_frame(){
	// check frame more accurately in code
	var index = argument0;
	return (image_index >= index + 1 - image_speed) && (image_index < index + 1);
}