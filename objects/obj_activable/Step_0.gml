if (init_dir==-1) && (movedir!="") {
	if status == "one" {
		dir = -1;
	} else {
		dir = 1;
	}
} else {
	if status == "one" {
		dir = 1;
	} else {
		dir = -1;
	}
}
switch(movedir) {
	case "horizontal":
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
	break;
	
	case "vertical":
		vsp = movespd * dir;
		var wallCollision = place_meeting(x,y+vsp,obj_solid);
		
		if (wallCollision) {
			while (!place_meeting(x,y+vsp,obj_solid)) {
				y+=dir;
			}
			vsp=0;
		}
		
		with (obj_player) {
			if (!place_meeting(x,y+other.vsp,obj_solid)) {
				if (place_meeting(x,y+abs(other.vsp),other) && !place_meeting(x,y,other)) {
					y+=other.vsp;
				}
			}
		}
		
		y+=vsp 
	break;
}

if (activable) {
	switch(status) {
		case "one":
			active = true;
		break;
		case "two":
			active = false;
		break;
	}
}