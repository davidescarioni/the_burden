if place_meeting(x,y,obj_player) && !taken {
	taken = true;
	audio_play_sound(snd_collect,1,false);
}