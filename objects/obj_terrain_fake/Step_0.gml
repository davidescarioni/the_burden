if instance_exists(obj_player) {
	if place_meeting(x,y, obj_player) && !touch {
		touch = true
		audio_play_sound(snd_collect,1,false)
	}
}

if (touch && alpha >= 0) {
	alpha -= 0.05
}