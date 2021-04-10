if go_out {
	lerpProgress += (1-lerpProgress) / 50;

	y1 = lerp(y1,y1Target,lerpProgress);
	
	if y1 == y1Target {
		instance_create_layer(x,y,"Pause",obj_start_menu);
		instance_destroy();
	}
}