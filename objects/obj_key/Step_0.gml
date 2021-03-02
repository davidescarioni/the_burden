if instance_exists(obj_player) {
	if (place_meeting(x,y,obj_player)) {
		if (door!=noone) {
			door.open = true;
		}
	}
}