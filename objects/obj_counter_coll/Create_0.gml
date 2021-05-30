count_total = instance_number(obj_collectible);
count_taken = 0;

audio_stop_all();
if (room == rm_lv1) {
	if !audio_is_playing(snd_theme) {
		audio_play_sound(snd_theme,1,true);
	}
}

if (room == rm_lv2) {
	if !audio_is_playing(snd_theme2) {
		audio_play_sound(snd_theme2,1,true);
	}
}

if (room == rm_lv3) {
	if !audio_is_playing(snd_theme3) {
		audio_play_sound(snd_theme3,1,true);
	}
}