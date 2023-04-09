//camera width and height
camWidth = 640;
camHeight = 360;

//half of those variables
//this is to use as a reference because we want to keep the player
//at the center of the screen at (almost) all times
halfcamerawidth = camWidth/2;
halfcameraheight = camHeight/2;

//Change the app surface to match the camera's +1
//(the actual camera size in the room is that of those variables +1)
surface_resize(application_surface,camWidth+1,camHeight+1);
//application_surface_draw_enable(false);
window_set_fullscreen(true);

global.Xoffset = (global.monitor_w-640)/2;
global.Yoffset = (global.monitor_h-360)/2

/*
if (global.monitor_w>=1280&&global.monitor_h>=720)
then
{
	surface_resize(application_surface, 1280, 720);
	global.Xoffset=(global.monitor_w-1280)/2;
	global.Yoffset=(global.monitor_h-720)/2;
}
*/


//Have the camera follow the player by default
following = obj_player;


xTo = x;
yTo = y;


