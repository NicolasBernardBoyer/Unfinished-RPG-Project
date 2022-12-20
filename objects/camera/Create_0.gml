camWidth = 430;
camHeight = 320;

halfcamerawidth = camWidth/2;
halfcameraheight = camHeight/2;

surface_resize(application_surface,camWidth+1,camHeight+1);
application_surface_draw_enable(false);

following = obj_player;

xTo = x;
yTo = y;


