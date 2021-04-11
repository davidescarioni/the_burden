if !layer_exists("Pause") {
	layer_create(10,"Pause");
}

switch (room) {
	case (rm_menu):
		if !instance_exists(obj_title) && !instance_exists(obj_start_menu) {
			instance_create_layer(room_width/2,room_height/2,"Pause",obj_title)
		}
	break;
	
	case (rm_sel_level):
		if !instance_exists(obj_sel_level) {
			instance_create_layer(x,y,"Pause",obj_sel_level)
			show_debug_message("Obj sel level")
		}
	break;
	
	default:
		if !instance_exists(obj_menu) {
			instance_create_layer(x,y,"Pause",obj_menu)
		}
	break;
}