///@param object_name
function scr_jumpThrougCollision(argument0) {
	with (argument0) {
		if (other.vsp > 0 && active) {
			if (place_meeting(x,y-ceil(other.vsp), other) && !place_meeting(x,y,other)) {
				while (!place_meeting(x,y-1,other)) {
					other.y += 1;
				}
				other.vsp = 0;
			}
		}
	}
}