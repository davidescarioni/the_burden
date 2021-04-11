function saveGame() {
	var _saveData = array_create(0);
	
	save_data(_saveData, "maxLevel");
	save_data(_saveData, "completeLevel1");
	save_data(_saveData, "completeLevel2");
	save_data(_saveData, "completeLevel3");
	save_data(_saveData, "lastCheckpointX");
	save_data(_saveData, "lastCheckpointY");
	save_data(_saveData, "lastRoom");
	
	// Turn this data in JSON string and save it via buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer,"game.burden"); 
	buffer_delete(_buffer);
	saveCollectibles();

	show_debug_message("Game Saved");
}

function loadDataGame() {
	if file_exists("game.burden") {
		var _buffer = buffer_load("game.burden");
		var _string = buffer_read( _buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse(_string);
		
		while (array_length(_loadData) > 0) {
			var _loadEntity = array_pop(_loadData);
			show_debug_message(_loadEntity)
			variable_global_set(string(_loadEntity.variable), _loadEntity.value)
		}
	}
}

function loadGame() {
	if file_exists("game.burden") {
		var _buffer = buffer_load("game.burden");
		var _string = buffer_read( _buffer, buffer_string);
		buffer_delete(_buffer);
	
		var _loadData = json_parse(_string);
		
		while (array_length(_loadData) > 0) {
			var _loadEntity = array_pop(_loadData);
			show_debug_message(_loadEntity)
			variable_global_set(string(_loadEntity.variable), _loadEntity.value)
		}
	}
	
	global.load = true;
	if (room != global.lastRoom) {
		room_goto(global.lastRoom);
	}
	
}

function saveCollectibles() {
	//Make Save Array

	var _saveData = array_create(0);

	//for every instance create a struct in the array
	with (obj_collectible) {
		var _saveEntity = {
			obj : object_get_name(object_index),
			room_name: room,
			y : y,
			x : x,
			taken: taken,
		}
	
		array_push(_saveData, _saveEntity);
	}

	// Turn this data in JSON string and save it via buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer,"collectibles.burden"); 
	buffer_delete(_buffer);

	show_debug_message("Collectibles Saved: " + _string)
}

function loadCollectibles() {
	fileName = "collectibles.burden"
	if file_exists(fileName) {

		var str = "";
		var file = file_text_open_read(fileName);
		str += file_text_readln(file)
		var _loadData = json_parse(str);
	
		while (array_length(_loadData) > 0) {
			var _loadEntity = array_pop(_loadData);
			with (instance_create_layer(0,0,"Instances",asset_get_index(_loadEntity.obj))) {
				if (room == _loadEntity.room_name) {
					x = _loadEntity.x;
					y = _loadEntity.y;
					taken = _loadEntity.taken;
				}
			}
		}
		file_text_close(file);
	} else {
		saveCollectibles();
	}
}

function saveCheckpoint() {

}

function loadCheckpoint() {

}
