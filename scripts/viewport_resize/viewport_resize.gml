// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function viewport_resize(){
	win_wid=window_get_width();
	win_hgt=window_get_height();
	scale = 0;
if (win_wid/win_hgt>=16/9) {
    //wider
    scale=win_wid/1280;
} else {
    //taller
    scale=win_hgt/720;
}
view_hport[0]=win_hgt;
view_wport[0]=win_wid;
camera_set_view_size(camera,win_wid/scale,win_hgt/scale);
}