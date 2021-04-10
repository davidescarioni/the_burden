function newTextBox(text,color,sprite){
	var _obj;
	if instance_exists(obj_text) {
		_obj = obj_text_queued;
	} else {
		_obj = obj_text;
	}
	
	with (instance_create_layer(0,0,"Player",_obj)) {
		message = text;
		col = color;
		spr = sprite;
		if instance_exists(other) {
			originInstance = other.id;
		} else {
			originInstance = noone;
		}
	}
	
}