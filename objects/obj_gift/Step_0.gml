y  = y + sin(timer * 0.1) * 0.25;
timer++;

if instance_exists(obj_player) {
	if place_meeting(x,y,obj_player) {
		global.tasklvl2 = true;
		instance_destroy();
	}
}