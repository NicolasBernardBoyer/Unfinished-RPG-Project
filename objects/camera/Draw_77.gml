// This code prevent camera jitter and makes for smooth movement
gpu_set_blendenable(false);

//find how much the window is scaled in proportion to the camera
var _scale = window_get_width()/camWidth;

draw_surface_ext
(
	application_surface,
	0 - (frac(x)*_scale),
	0 - (frac(y)*_scale),
	_scale,
	_scale,
	0,
	c_white,
	1.0
);

gpu_set_blendenable(true);






