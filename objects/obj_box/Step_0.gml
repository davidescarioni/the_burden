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
	if (place_meeting(x,y+vsp,obj_activable_limited)) {
		while (!place_meeting(x,y+sign(vsp),obj_activable_limited)) {
			y+=sign(vsp)
		}
		vsp = other.vsp;
	}
	y += vsp;
	
	if (place_meeting(x,y+vsp,obj_spring) && vsp > 0 && !place_meeting(x,y,obj_spring)) {
		var inst = instance_place(x,y+vsp,obj_spring);
		with (inst) {
			coll = true;
			alarm[0] = 5;
			if !audio_is_playing(snd_bonk) {
				audio_play_sound(snd_bonk,1,false)
			}
		}
		while (!place_meeting(x,y+sign(vsp),obj_spring)) {
			y+=sign(vsp)
		}
		vsp = inst.jumpPower;
	}

	
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