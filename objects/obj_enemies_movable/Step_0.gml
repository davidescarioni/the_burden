if instance_exists(obj_player) {
		if (movedir=="horizontal") {
			x = xstart-abs((left_d+1)/2)+sin(increased_value/1000)*abs(left_d/2);
			increased_value+=15;
		}
	
		if (movedir=="vertical") {
			//y = ystart-abs((down_d+1)/2)+sin(increased_value/1000)*abs(down_d/2);
			//increased_value+=15;
			
				y+=sin(timer*0.05)*0.95
				timer++;
			
			//vsp = movespd * dir;
		
			//var heightOffset = sprite_get_height(spr_player_idle)
			//var wallCollision = place_meeting(x,y+(heightOffset*dir),obj_solid);
		
			//if (wallCollision) {
			//	dir = dir*-1;
			//}
		
			//y+=vsp 
		}
}

image_angle+=10;