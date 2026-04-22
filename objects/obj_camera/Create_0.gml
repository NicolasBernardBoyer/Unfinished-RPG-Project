//obj_camera width and height
cam_width = 640;
cam_height = 360;

//half of those variables
//this is to use as a reference because we want to keep the player
//at the center of the screen at (almost) all times
halfcamerawidth = cam_width/2;
halfcameraheight = cam_height/2;

//Change the app surface to match the obj_camera's
//(the actual obj_camera size in the room is that of those variables)
surface_resize(application_surface,cam_width,cam_height);
application_surface_draw_enable(false);

global.x_offset = (global.monitor_w-640)/2;
global.y_offset = (global.monitor_h-360)/2

//Have the obj_camera follow the player by default
following = obj_player;


x_to = x;
y_to = y;


