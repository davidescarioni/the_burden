if !audio_group_is_loaded(audiogroup_soundeffects) {
   audio_group_load(audiogroup_soundeffects);
}

if keyboard_check_released(ord("Q")) {
	audio_group_set_gain(audiogroup_soundeffects,0,0)
	show_debug_message("Q");
}

if keyboard_check_released(ord("W")) {
	audio_group_set_gain(audiogroup_soundeffects,0.5,0)
	show_debug_message("Q");
}

if keyboard_check_released(ord("E")) {
	audio_group_set_gain(audiogroup_soundeffects,1,0)
	show_debug_message("Q");
}