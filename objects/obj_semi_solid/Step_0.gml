if add_spring && !create_spring {
	instance_create_layer(x-1,y,layer,obj_spring);
	create_spring = true;
}

if instance_exists(obj_player) {
	//if (obj_player.ladder) {
		if (movedir=="horizontal") {
			x = xstart-abs((left_d+1)/2)+sin(increased_value/1000)*abs(left_d/2);
			increased_value+=15;

			//hsp = movespd * dir;
			
			//if (dir==1) {
			//	x = lerp(x+hsp,maxx,.005)
			//} else {
			//	x = lerp(x+hsp,minx,.005)
			//}
			
			//if (x>=maxx) || (x<=minx) {
			//	dir*=-1;
			//}
	
			//var wallCollision = place_meeting(x+hsp,y,obj_solid);
	
			//if (wallCollision) {
			//	while (!place_meeting(x+hsp,y,obj_solid)) {
			//		x+=dir;
			//	}
			//	dir*=-1;
			//}
			//x=hsp
	
			with (obj_player) {
				if (!place_meeting(x+other.hsp,y,obj_solid)) {
					if (place_meeting(x,y+1,other) && !place_meeting(x,y,other)) {
						//x+=other.hsp;
						delta = other.x - other.xprevious
						x+=delta
					}
				}
			}
			
			with (obj_shell) {
				if (!place_meeting(x+other.hsp,y,obj_solid)) {
					if (place_meeting(x,y+1,other) && !place_meeting(x,y,other)) {
						//x+=other.hsp;
						delta = other.x - other.xprevious
						x+=delta
					}
				}
			}
			
			
			with (obj_spring) {
				if (!place_meeting(x+other.hsp,y,obj_solid)) {
					if (place_meeting(x,y+1,other) && !place_meeting(x,y,other)) {
						//x+=other.hsp;
						//delta = other.x - other.xprevious
						//x+=delta
						x = other.x;
					}
				}
			}
		}
	
		if (movedir=="vertical") {
		
			vsp = movespd * dir;
		
			var heightOffset = sprite_get_height(spr_player_idle)
			var wallCollision = place_meeting(x,y+(heightOffset*dir),obj_solid);
		
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
			
			with (obj_shell) {
				if (!place_meeting(x,y+other.vsp,obj_solid)) {
					if (place_meeting(x,y+abs(other.vsp),other) && !place_meeting(x,y,other)) {
						y+=other.vsp;
					}
				}
			}
			
			with (obj_box) {
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