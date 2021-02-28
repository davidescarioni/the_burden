if (checkpoint) {
	image_speed = 2;
} else {
	image_speed = 0;
	image_index = 0;
}

if (instance_exists(obj_player)) {
	if (place_meeting(x,y,obj_player)) {
		with (obj_checkpoint) {
			checkpoint = false;
		}
		checkpoint = true;
		// Salvare checkpoint
	}
}