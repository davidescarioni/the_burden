if place_meeting(x,y,obj_player) && !taken {
	taken = true;
	audio_play_sound(snd_collect,1,false);
} 
if !taken {
	y  = y + sin(timer * 0.1) * 0.25;
	timer++;
}

