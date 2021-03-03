if instance_exists(obj_player) {
	if (place_meeting(x,y,obj_player)) {
		if (door!=noone) {
			global.roomOneKey = true;
		}
	}
}

if (global.roomOneKey == true) {
	door.open = true;
	instance_destroy();
}