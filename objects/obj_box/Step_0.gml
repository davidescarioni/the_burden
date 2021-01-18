if (lifted) {
	if instance_exists(obj_player) {
		var facing = obj_player.image_xscale
		x = obj_player.x + 6*facing;
		y = obj_player.y+4;
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
	
	//Adjusting x pos
	if place_meeting(x,y,obj_solid) {
		block = instance_place(x,y,obj_solid);
		if x < block.x {
			while (place_meeting(x,y,block)) {
				x-=1;
			}
		} else {
			while (place_meeting(x,y,block)) {
				x+=1;
			}
		}
	}
}