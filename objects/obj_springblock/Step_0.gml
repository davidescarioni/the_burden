event_inherited();

with (obj_player) {
	if (place_meeting(x,y+vsp,other)) {
		other.coll = true;
		other.alarm[0] = 5;

		while (!place_meeting(x,y+sign(vsp),other)) {
			y+=sign(vsp)
		}
		
		vsp = other.jumpPower;
	}
}
