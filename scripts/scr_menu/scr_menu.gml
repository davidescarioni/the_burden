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
	
	save_options();

	show_debug_message("Global Saved")
	
	global.pause = false;
}

function new_game() {
	room_goto(rm_lv1);
	show_debug_message("Nuova Partita");
}

function save_options() {
	//Make Save Array

	var _saveData = array_create(0);

	//for every instance create a struct in the array
	save_data(_saveData, "key_enter");
	save_data(_saveData, "key_left");
	save_data(_saveData, "key_right");
	save_data(_saveData, "key_up");
	save_data(_saveData, "key_down");
	save_data(_saveData, "key_jump");
	save_data(_saveData, "key_eject");
	save_data(_saveData, "key_launch");
	save_data(_saveData, "key_lift");
	
	save_data(_saveData, "volume_effects");
	save_data(_saveData, "volume_music");

	// Turn this data in JSON string and save it via buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer,"settings.burden"); 
	buffer_delete(_buffer);
}

function save_data() {
	_saveData = argument0;
	_saveVariable = argument1;
	if (string(_saveVariable) != "null") {
		var _saveEntity = {
			variable : _saveVariable,
			value : variable_global_get(_saveVariable),
		}
	
		array_push(_saveData, _saveEntity);
		show_debug_message("Save: " + _saveVariable)
	}
}

function load_data() {
	if file_exists("settings.burden") {
		var _buffer = buffer_load("settings.burden");
		var _string = buffer_read( _buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse(_string);
	
		while (array_length(_loadData) > 0) {
			var _loadEntity = array_pop(_loadData);
			variable_global_set(string(_loadEntity.variable), _loadEntity.value)
		}
	}
}

function reset_settings() {
	global.key_enter = vk_enter;
	global.key_left = vk_left;
	global.key_right = vk_right;
	global.key_up = vk_up;
	global.key_down = vk_down;
	global.key_jump = ord("Z");
	global.key_eject = ord("X");
	global.key_launch = ord("A");
	global.key_lift = ord("C");

	global.volume_effects = 1;
	global.volume_music = 1;
	save_options();
}

function exit_game() {
	game_end();
}

function change_volume() {
	var type = menu_option[page];
	
	switch (type) {
		case 0:
			audio_master_gain(argument0)
			break;
		case 1:
			audio_group_set_gain(audiogroup_soundeffects, argument0, 0);
			global.volume_effects = argument0;
			break;
		case 2:
			audio_group_set_gain(audiogroup_music, argument0, 0);
			global.volume_music = argument0;
			break;
	}
}

function change_resolution() {
	switch (argument0) {
		case 0:
			 window_set_size(256,144);
			 break;
		case 1:
			window_set_size(512,288);
			 break;
		case 2:
			window_set_size(1024,576);
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