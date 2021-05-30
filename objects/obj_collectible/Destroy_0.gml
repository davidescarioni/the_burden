obj_counter_coll.count_taken+=1;
	if !audio_is_playing(snd_collect) {
		audio_play_sound(snd_collect,1,false);
	}