if !(global.pause) exit;

input_up_p = keyboard_check_pressed(global.key_up);
input_down_p = keyboard_check_pressed(global.key_down);
input_enter_p = keyboard_check_pressed(global.key_enter) || keyboard_check_pressed(global.key_jump) ;

var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

if (inputting) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.shift:
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left)
			if (hinput != 0) {
				// TODO: audio
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,array_length(ds_grid[# 4,menu_option[page]])-1);
			}
			break;
		case menu_element_type.slider:
			switch (menu_option[page]) {
				case 0:
				//test master audio
				break;
				case 1:
				//test soundeffect
				break;
				case 2:
				//test music
				break;
			}
			var hinput = keyboard_check(global.key_right) - keyboard_check(global.key_left)
			if (hinput != 0) {
				// TODO: audio
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,1);
			}
			break;
		case menu_element_type.toggle:
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left)
			show_debug_message("here")
			if (hinput != 0) {
				// TODO: audio
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,1);
			}
			break;
		case menu_element_type.input:
			var kk = keyboard_lastkey;
			if (kk != vk_enter) { //Inserire qui tutti i pulsanti da far evitare di mappare
				if (kk != ds_grid[# 3, menu_option[page]]) {
					// TODO: audio
				}
				ds_grid[# 3, menu_option[page]] = kk;
				variable_global_set(ds_grid[# 2, menu_option[page]], kk);
			}
			break;
	}
} else {
	var ochange = (input_down_p - input_up_p);
	if (ochange != 0) {
		menu_option[page] += ochange;
		menu_option[page] = clamp(menu_option[page],0,ds_height-1);
		// TODO: audio
	}
}

if (input_enter_p) {
	switch (ds_grid[# 1, menu_option[page]]) {
		case menu_element_type.script_runner:
			script_execute(ds_grid[# 2, menu_option[page]]);
			break;
		case menu_element_type.page_transfer:
			page = ds_grid[# 2, menu_option[page]]; 
			break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle:
			if (inputting) {
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			}
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	// TODO: audio transition
}