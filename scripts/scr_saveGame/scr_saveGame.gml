function saveGame() {
	var _saveData = array_create(0);
	
	save_data(_saveData, "global.lastCheckpointX");
	save_data(_saveData, "global.lastCheckpointY");
	save_data(_saveData, "global.lastRoom");
	
	// Turn this data in JSON string and save it via buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer,"game.burden"); 
	show_debug_message(_string);
	buffer_delete(_buffer);

	show_debug_message("Game Saved");
}

function loadGame() {
	if file_exists("game.burden") {
		var _buffer = buffer_load("game.burden");
		var _string = buffer_read( _buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse(_string);
		show_debug_message(_loadData)
		while (array_length(_loadData) > 0) {
			var _loadEntity = array_pop(_loadData);
			variable_global_set(string(_loadEntity.variable), _loadEntity.value)
		}
	}
}

function saveCollectibles() {

}

function loadCollectibles() {

}

function saveCheckpoint() {

}

function loadCheckpoint() {

}
