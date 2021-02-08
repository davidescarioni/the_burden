if !(global.pause) exit;

input_up_p = keyboard_check_pressed(global.key_up);
input_down_p = keyboard_check_pressed(global.key_down);
input_enter_p = keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

var ochange = (input_down_p - input_up_p);
if (ochange != 0) {
	menu_option[page] += ochange;
	menu_option[page] = clamp(menu_option[page],0,ds_height-1);
}

if (input_enter_p) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]]; 
			break;
	}
	
	// TODO: audio transition
}