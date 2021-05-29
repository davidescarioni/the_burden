if (taken) && instance_exists(obj_player) {
	var max_spd = 1.2
	if distance_to_object(obj_player) < 8 {
		max_spd = 0.1
	}
	spd = lerp(spd,max_spd,0.05)
	move_towards_point(obj_player.x,obj_player.y-10,spd)
	with (item) {
		instance_destroy()
	}
}