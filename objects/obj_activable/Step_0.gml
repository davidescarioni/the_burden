if status == "one" {
	dir = -1;
} else {
	dir = 1;
}
if (movedir=="horizontal") {
	
	hsp = movespd * dir;
	
	var wallCollision = place_meeting(x+hsp,y,obj_solid);
	
	if (wallCollision) {
		while (!place_meeting(x+hsp,y,obj_solid)) {
			x+=dir;
		}
		hsp=0;

	}
	x+=hsp
	
	with (obj_player) {
		if (!place_meeting(x+other.hsp,y,obj_solid)) {
			if (place_meeting(x,y+1,other) && !place_meeting(x,y,other)) {
				x+=other.hsp;
			}
		}
	}
}