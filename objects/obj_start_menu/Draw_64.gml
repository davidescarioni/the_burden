var gwidth = global.view_width;
var gheight = global.view_height;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

var y_buffer = 16;
var x_buffer = 16;

var start_y = (gheight/2) - ((((ds_height-1)/2)*y_buffer));

draw_set_font(fnt_new)

// Sfondo Menu
//var c = c_blue;
//draw_rectangle_color(0, 0, gwidth, gheight,c,c,c,c, false);

// Elementi a sinistra del menu
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var ltx = 20;

for (var yy = 0; yy<(ds_height); yy++) {
	lty = start_y + (yy*y_buffer);
	c = c_white;
	
	if (yy == menu_option[page]) {
		c = c_orange;
	}
	draw_text_color(ltx, lty, ds_grid[# 0, yy],c,c,c,c,1);

}

// Draw Elements on Right Side
draw_set_halign(fa_right);
 
var rtx = gwidth-x_buffer;
var rty;

yy = 0;
repeat(ds_height) {
	rty = start_y + (yy*y_buffer);
	switch (ds_grid[# 1, yy]) {
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			c = c_white;
			
			if (current_val == 0) {
				left_shift = "";
			}
			if (current_val == array_length(ds_grid[# 4,yy])-1) {
				right_shift = "";
			}
			
			if (inputting && yy = menu_option[page]) {
				c = c_yellow;
			}
			draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift,c,c,c,c,1);
			break;
			
		case menu_element_type.slider:
			var len = 64;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]) );
			c = c_white;
			
			if (inputting && yy = menu_option[page]) {
				c = c_orange;
			}
			
			var xpos = room_width / 2;
			
			draw_line_width(xpos, rty, xpos+len, rty, 2);
			draw_circle_color(xpos + (circle_pos * len), rty, 4, c, c, false);
			draw_text_color(rtx, rty, string(floor(circle_pos*100))+"%",c,c,c,c,1);
			
			break;
			
		case menu_element_type.toggle:
			var current_val = ds_grid[# 3, yy];
			var c1, c2;
			c = c_white;
			
			if (inputting && yy = menu_option[page]) {
				c = c_yellow;
			}
			
			if (current_val == 0 ) {
				c1 = c_dkgray;
				c2 = c;
			} else {
				c1 = c;
				c2 = c_dkgray;
			}
			
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1)
			draw_text_color(rtx - 50, rty, "OFF", c2, c2, c2, c2, 1)
			
			break;
			
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			
			switch(current_val) {
				case vk_up: string_val = "FRECCIA SU"; break;
				case vk_left: string_val = "FRECCIA SINISTRA"; break;
				case vk_right: string_val = "FRECCIA DESTRA"; break;
				case vk_down: string_val = "FRECCIA GIU"; break;
				default: string_val = chr(current_val) break;
			}
			
			c = c_white;
			if (inputting && yy = menu_option[page]) {
				c = c_yellow;
			}
			draw_text_color(rtx, rty, string_val, c, c, c, c, 1);
			
			break;
	}
	
	yy++;
}



// Reset to default
draw_set_halign(fa_top);