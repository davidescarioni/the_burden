event_inherited();

if (coll == true) {
	draw_yscale=1.2
	draw_xscale=1.2
} else {
	draw_xscale = lerp(draw_xscale, 1, .1);
	draw_yscale = lerp(draw_yscale, 1, .1);
}

with (obj_player) {
	if (place_meeting(x,y+vsp,other)) {
		other.coll = true;
		other.alarm[0] = 5;
		if !audio_is_playing(snd_bonk) {
			audio_play_sound(snd_bonk,1,false);
		}

		while (!place_meeting(x,y+sign(vsp),other)) {
			y+=sign(vsp)
		}
		
		vsp = other.jumpPower;
	}
	
	//if (place_meeting(x+hsp,y,other)) {
	//	other.coll = true;
	//	other.alarm[0] = 5;

	//	while (!place_meeting(x+sign(hsp),y,other)) {
	//		x+=sign(hsp)
	//	}
		
	//	vsp = other.jumpPower;
	//}
}

if (movedir=="horizontal") {
	x = xstart-abs((left_d+1)/2)+sin(current_time/800)*abs(left_d/2);
}
