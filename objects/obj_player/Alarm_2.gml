/// @description Exit Shop
move_lock = true;
if (room==rm_lv1) {
	global.tasklvl1 = true;
	buying = false;
	newTextBox("Farina presa, corro a portarla al nonno!", c_green, spr_thumb_turtle);
}
if (room==rm_lv2) {
	with (instance_create_depth(x,y,-1000,obj_fade)) {
		rm = rm_cutscene_lvl3;
		if (global.maxLevel <= 2) {
			global.maxLevel = 2;
			saveGame();
		}
	}
}
if (room==rm_lv3) {
	with (instance_create_depth(x,y,-1000,obj_fade)) {
		rm = rm_cutscene_fine_lv3;
		if (global.maxLevel <= 3) {
			global.maxLevel = 3;
			saveGame();
		}
	}
}