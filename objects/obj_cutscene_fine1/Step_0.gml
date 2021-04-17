if !can_escape exit
if keyboard_check_released(global.key_enter) || keyboard_check_released(global.key_jump) {
	if !instance_exists(obj_text) && !instance_exists(obj_text_queued) {
		with (instance_create_depth(x,y,-1000,obj_fade)) {
			rm = rm_lv2;
			if (global.maxLevel < 1) {
				global.maxLevel = 1;
				saveGame();
			}
		}
	}
}