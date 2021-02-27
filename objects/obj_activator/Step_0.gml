if (instance_exists(obj_activable)) {
	if (obj_one!=noone) {
		obj_one.status = other.status;
	}
	
	if (obj_two!=noone) {
		obj_two.status = other.status;
	}
	
	if (obj_three!=noone) {
		obj_three.status = other.status;
	}
}

//Animate
if status == "one" {
	image_index = 0;
} else {
	image_index = 1;
}