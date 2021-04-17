if (room==rm_lv1 || room==rm_lv2 || room==rm_lv3) {
	global.pause = !global.pause
}

if (room==rm_finale) || (room==rm_sel_level) ||  (room==rm_credits)  {
	room_goto(rm_menu);
}

if instance_exists(obj_text) {
	with (obj_text) {
		instance_destroy()
	}
}

if instance_exists(obj_text_queued) {
	with (obj_text_queued) {
		instance_destroy()
	}
}