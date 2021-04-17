if (room==rm_lv1 || room==rm_lv2 || room==rm_lv3) {
	global.pause = !global.pause
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