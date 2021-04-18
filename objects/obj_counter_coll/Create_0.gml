count_total = instance_number(obj_collectible);
count_taken = 0;

audio_stop_all();
if !audio_is_playing(snd_theme) {
	audio_play_sound(snd_theme,1,true);
}