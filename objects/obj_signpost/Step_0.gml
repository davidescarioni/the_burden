if instance_exists(obj_player) {
	if !obj_player.reading {
		if place_meeting(x,y,obj_player) && keyboard_check_released(global.key_up) {
			obj_player.reading = true;
			var col = $404493
			newTextBox(message,col,spr_thumb_signpost);
		}
	}
}