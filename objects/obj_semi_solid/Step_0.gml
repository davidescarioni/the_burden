
scr_input();

if instance_exists(obj_player) {
	if ((obj_player.bbox_bottom > y) || kDown) {
		mask_index = -1
	} else {
		mask_index = spr_semi_solid;
	}
}