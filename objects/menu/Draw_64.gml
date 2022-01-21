if(!global.pause) exit;

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x = gwidth/2;

//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0,0,gwidth,gheight, c,c,c,c, false);

//Draw Elements on Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);


//Draw Dividing Line



//Draw Elements on Right Side