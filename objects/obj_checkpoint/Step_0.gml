if (checkpoint) {
	image_speed = 2;

} else {
	image_speed = 0;
	image_index = 0;
}

if (instance_exists(obj_player)) {
	if (place_meeting(x,y,obj_player)) {
		global.lastRoom = room;
		global.lastCheckpointX = obj_player.x;
		global.lastCheckpointY = obj_player.y;
		show_debug_message(global.lastRoom);
		show_debug_message(global.lastCheckpointX);
		show_debug_message(global.lastCheckpointY);
		with (obj_checkpoint) {
			checkpoint = false;
		}
		checkpoint = true;
		// Salvare checkpoint
	}
}