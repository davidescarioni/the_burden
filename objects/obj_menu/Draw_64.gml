if !(global.pause) exit;

var gwidth = global.view_width;
var gheight = global.view_height;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

var y_buffer = 32;
var x_buffer = 16;

// Sfondo Menu
var c = c_black;
draw_rectangle_color(0, 0, gwidth, gheight,c,c,c,c, false);

// Elementi a sinistra del menu
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var ltx = 20;

for (var yy = 0; yy<(ds_height); yy++) {
	lty = 20 + (yy*y_buffer);
	c = c_white;
	
	if (yy == menu_option[page]) {
		c = c_orange;
	}
	draw_text_color(ltx, lty, ds_grid[# 0, yy],c,c,c,c,1);

}

// Draw Elements on Right Side