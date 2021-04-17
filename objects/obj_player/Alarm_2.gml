/// @description Exit Shop
buying = false;
move_lock = true;
if (room==rm_lv1) global.tasklvl1 = true;
if (room==rm_lv2) {
	with (instance_create_depth(x,y,-1000,obj_fade)) {
		rm = rm_cutscene_lvl3;
		if (global.maxLevel <= 2) {
			global.maxLevel = 2;
			saveGame();
		}
	}
}