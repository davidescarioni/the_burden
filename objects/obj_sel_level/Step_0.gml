if keyboard_check_released(global.key_up) {
	sel-=1;
}

if keyboard_check_released(global.key_down) {
	sel+=1;
}

sel = clamp(sel,1,max_sel);

if keyboard_check_released(global.key_jump) || keyboard_check_released(global.key_enter) {
	switch (sel) {
		case 1:
			room_goto(rm_cutscene_lvl1);
		break;
		
		case 2:
			room_goto(rm_lv2);
		break;
	}
}