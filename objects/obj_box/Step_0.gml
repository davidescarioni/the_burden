if (lifted) {
	if instance_exists(obj_player) {
		x = obj_player.x;
		y = obj_player.y;
	}
} else {
	event_inherited();
	
	//Falling
	vsp = vsp + grav;
	
	scr_jumpThrougCollision(obj_semi_solid);
	
	if (place_meeting(x,y+vsp,obj_solid)) {
		while (!place_meeting(x,y+sign(vsp),obj_solid)) {
			y+=sign(vsp)
		}
		vsp = 0;
	}
	y += vsp;
}