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

function exit_game() {
	game_end();
}

function change_volume() {
	var type = argument0;
	
	switch (type) {
		case 0:
			audio_master_gain(argument0)
			break;
		case 1:
			audio_group_set_gain(audiogroup_soundeffects, argument0, 0);
			break;
		case 2:
			audio_group_set_gain(audiogroup_music, argument0, 0);
			break;
	}
}

function change_resolution() {
	switch (argument0) {
		case 0:
			 window_set_size(100,100);
			 break;
		case 1:
			window_set_size(200,200);
			 break;
		case 2:
			window_set_size(300,300);
			 break;
	}
	window_center();
}

function change_window_mode() {
	switch (argument0) {
		case 0:
			window_set_fullscreen(false);
		break;
		case 1:
			window_set_fullscreen(true);
		break;
	}
}