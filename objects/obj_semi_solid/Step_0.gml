if instance_exists(obj_player) {
	//if (obj_player.ladder) {
		if (movedir=="horizontal") {
	
			hsp = movespd * dir;
	
			var wallCollision = place_meeting(x+hsp,y,obj_solid);
	
			if (wallCollision) {
				while (!place_meeting(x+hsp,y,obj_solid)) {
					x+=dir;
				}
				dir*=-1;
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
	
		if (movedir=="vertical") {
		
			vsp = movespd * dir;
		
			var heightOffset = sprite_get_height(spr_player_idle)
			var wallCollision = place_meeting(x,y+vsp+(heightOffset*dir),obj_solid);
		
			if (wallCollision) {
				dir = dir*-1;
			}
		
			with (obj_player) {
				if (!place_meeting(x,y+other.vsp,obj_solid)) {
					if (place_meeting(x,y+abs(other.vsp),other) && !place_meeting(x,y,other)) {
						y+=other.vsp;
					}
				}
			}
		
			y+=vsp 
		}
	//}
}

