alarm[0] = room_speed;
can_escape = false;

audio_stop_all();
if !audio_is_playing(snd_cutscene) {
	audio_play_sound(snd_cutscene,1,true);
}