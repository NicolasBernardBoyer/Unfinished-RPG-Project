// if you aren't pausing or can't pause don't display anything
if(!global.pause) exit;
if(!global.can_pause) exit;

// exit if the page is less than 1 (no main page on main menu)
if(room = rm_title_settings){
	if (page < 1){
		exit;
	}
}

// set the draw font
draw_set_font(fnt_excelsior);

// references for game width and height
var gwidth = global.view_width, gheight = global.view_height;

// create a grid equivalent to page, same as in step
var ds_grid = page, ds_height = ds_grid_height(ds_grid);
// buffer for drawing
var y_buffer = 32, x_buffer = 16;
// starting position for drawing
var start_y = (gheight/2) - ((((ds_height)/2) * y_buffer)), start_x = gwidth/2;

//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0,0, gwidth, gheight, c,c,c,c, false);

//Draw Elements on LEFT Side
draw_set_valign(fa_middle);
draw_set_halign(fa_RIGHT);

// LEFT text
var ltx = start_x - x_buffer*2, lty, xo; 

// draw the text for the menu options
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
draw_line(start_x-x_buffer, start_y-y_buffer, start_x-x_buffer, lty+y_buffer);

//Draw Elements on RIGHT Side
draw_set_halign(fa_LEFT);

//RIGHT text
var rtx = start_x + x_buffer/4, rty;

// draw the specific ds_grid elements depending on the menu element type
// repeat for the size of the ds_height
yy = 0; repeat(ds_height){
	rty = start_y + (yy*y_buffer);
	
	switch(ds_grid[# 1, yy]){
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var LEFT_shift = "<< ";
			var RIGHT_shift = " >>";
		
			if(current_val == 0) LEFT_shift = "";
			if(current_val == array_length_1d(ds_grid[# 4, yy])-1) RIGHT_shift = "";
		
			c = c_white;
			
			if(inputting and yy == menu_option[page]) { c = c_yellow; }
			draw_text_color(rtx, rty, LEFT_shift+current_array[current_val]+RIGHT_shift, c,c,c,c, 1);
		
		break;
		
		case menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			c = c_white;
			var nub_c = c_gray;
			
			draw_line_width(rtx, rty, rtx +len, rty, 2);
			
			if(inputting and yy == menu_option[page]) { c = c_yellow; nub_c = c_yellow  }
			draw_rectangle_color(rtx + (current_val*len)-4, rty-4, rtx + (current_val*len)+4, rty+4, nub_c,nub_c,nub_c,nub_c, false);
			draw_text_color(rtx+ (len * 1.2), rty, string(floor(current_val*100))+"%", c,c,c,c, 1);
		break;
			
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = c_white;
			if(inputting and yy == menu_option[page]) { c = c_yellow; }
			
			if(current_val == 0) { c1 = c; c2 = c_dkgray; }
			else				 { c1 = c_dkgray; c2 = c; }
		
		
			draw_text_color(rtx, rty, "ON", c1,c1,c1,c1, 1);
			draw_text_color(rtx +32, rty, "OFF", c2,c2,c2,c2, 1);
		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			
			switch(current_val){
				case vk_UP:		string_val = "UP Key"; break;
				case vk_LEFT:	string_val = "LEFT Key"; break;
				case vk_RIGHT:	string_val = "RIGHT Key"; break;
				case vk_DOWN:	string_val = "DOWN Key"; break;
				default:		string_val = chr(current_val); break;
			}
			
			c = c_white;
			if(inputting and yy == menu_option[page]) { c = c_yellow; }
			draw_text_color(rtx, rty, string_val, c,c,c,c, 1);
		
		break;
	}
		
	yy++;
}

draw_set_valign(fa_top);



