draw_set_font(fnt_excelsior);

if(!global.pause) exit;

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = page, ds_height = ds_grid_height(ds_grid);
var y_buffer = 32, x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height)/2) * y_buffer)), start_x = gwidth/2;

//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0,0, gwidth, gheight, c,c,c,c, false);

//Draw Elements on Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo; 

var yy = 0; repeat(ds_height){
	lty = start_y + (yy*y_buffer);
	c = c_white;
	xo = 0;
	
	if(yy == menu_option[page]) {
		c = c_yellow;
		xo = -(x_buffer/2);
	}
	
	draw_text_color(ltx+xo, lty, ds_grid[# 0, yy], c,c,c,c, 1);
	yy++;
}

//Draw Dividing Line
draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);


//Draw Elements on Right Side