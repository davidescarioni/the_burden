if instance_exists(obj_player) {
	if (place_meeting(x,y,obj_player)) {
		if (door!=noone) {
			screenShake(5,30)
			door.open = true;
			instance_destroy();
		}
	}
}

//if (global.roomOneKey == true) {
//	door.open = true;
//	instance_destroy();
//}