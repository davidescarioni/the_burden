if instance_exists(obj_player) {
		if  global.tasklvl1 && place_meeting(x,y,obj_player) {
			with (instance_create_depth(x,y,-1000,obj_fade)) {
				rm = rm_cutscene_lvl2;
			}
		}
}