if (taken) && instance_exists(obj_player) {
	show_debug_message("Follow");
	move_towards_point(obj_player.x,obj_player.y-10,1.5)
}