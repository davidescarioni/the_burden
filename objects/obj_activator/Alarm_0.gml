if (instance_exists(obj_activable)) {
	if (obj_one!=noone) {
		if (obj_one.status=="one") {
			obj_one.status="two"
		} else {
			obj_one.status="one"
		}
		//obj_one.status = other.status;
	}
	
	if (obj_two!=noone) {
		if (obj_two.status=="one") {
			obj_two.status="two"
		} else {
			obj_two.status="one"
		}
		//obj_two.status = other.status;
	}
	
	if (obj_three!=noone) {
		if (obj_three.status=="one") {
			obj_three.status="two"
		} else {
			obj_three.status="one"
		}
		//obj_three.status = other.status;
	}
}