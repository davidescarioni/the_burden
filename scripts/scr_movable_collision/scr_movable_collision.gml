///@param object_name
function jumpThrougCollision(argument0) {

	if (other.vsp == 0) {
		if (place_meeting(x,y-other.vsp, other) && !place_meeting(x,y,other)) {
			while (!place_meeting(x,y-1,other)) {
				other.y += 1;
			}
			other.vsp = 0;
		}
	} 
}