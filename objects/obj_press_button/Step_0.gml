if instance_exists(obj_player) {
	if place_meeting(x, y-1, obj_player) {
		if (image_index==1) {
			image_index = 2;
			if !(active) {
				alarm[0] = 1;
				active = true;
			}
		}
		if (image_index==0) {
			image_index = 1;
		}
	} else {
		if (image_index==1) {
			image_index = 0;
			if (active) {
				alarm[0] = 1;
				active = false;
			}
		}
		if (image_index==2) {
			image_index = 1;
		}
	}
}

if instance_exists(obj_shell) {
	if place_meeting(x, y-1, obj_shell) {
		if (image_index==1) {
			image_index = 2;
			if !(active) {
				alarm[0] = 1;
				active = true;
			}
		}
		if (image_index==0) {
			image_index = 1;
		}
	} else {
		if (image_index==1) {
			image_index = 0;
			if (active) {
				alarm[0] = 1;
				active = false;
			}
		}
		if (image_index==2) {
			image_index = 1;
		}
	}
}