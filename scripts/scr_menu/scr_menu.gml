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

function resume_game() {}

function exit_game() {}

function change_volume() {}

function change_resolution() {}

function change_window_mode() {}