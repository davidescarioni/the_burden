function create_menu_page(){
	var i = 0;
	var arg;
	
	repeat(argument_count) {
		arg[i] = argument[i];
		i++;
	}
	
	var ds_grid_id = ds_grid_create(5, argument_count); //5 perchè non ho voci più lunghe
	i = 0;
	repeat(argument_count) {
		var array = arg[i];
		var array_len = array_length(array);
		
		var xx = 0;
		repeat(array_len) {
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
		
		i++;
	}
	
	return ds_grid_id;
}

function resume_game() {
	show_debug_message("Game Resume")
}

function exit_game() {}

function change_volume() {
	show_debug_message("Volume change to " +string(argument0))
}

function change_resolution() {
	show_debug_message("Resolution change to " +string(argument0))
}

function change_window_mode() {
	show_debug_message("Windows change to " +string(argument0))
}