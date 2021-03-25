if instance_exists(obj_player) {
	//if (obj_player.ladder) {
		if (movedir=="horizontal") {
			x = xstart-abs((left_d+1)/2)+sin(current_time/800)*abs(left_d/2);
	
			with (obj_player) {
				if (!place_meeting(x+other.hsp,y,obj_solid)) {
					if (place_meeting(x,y+1,other) && !place_meeting(x,y,other)) {
						//x+=other.hsp;
						delta = other.x - other.xprevious
						x+=delta
					}
				}
			}
		}
	
		if (movedir=="vertical") {
		
			y = (ystart-8)-abs((up_d)/2)+sin(current_time/200)*abs(up_d/2);		
		
			with (obj_player) {
				if place_meeting(x+hsp,y,other) {
				    if place_meeting(x+hsp,y,other) {
				        while (!place_meeting(x+sign(hsp),y,other)) x+=sign(hsp);
				        hsp = 0;
				    }
				}
			}

		}
	//}
}