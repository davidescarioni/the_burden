function screenShake(magnitude, frames) {
	var _magnitude = magnitude;
	var _frames = frames;
	with (obj_camera) {
		if (_magnitude > shakeRemain) {
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _frames;
		}
	}
}

function key_to_string(key) {
/// key_to_string( key )
/*//
How to use:
Simply call this script in a draw_text function. 
argument0 should be a keyboard key such as vk_enter or ord('Z').
//*/
 
	if (key > 48 && key < 91) { 
		return chr(key); 
	}
	switch(key) {
	    case -1: return "No Key";
	    case 8: return "Backspace";
	    case 9: return "Tab";
	    case 13: return "Invio";
	    case 16: return "Shift";
	    case 17: return "Ctrl";
	    case 18: return "Alt";
	    case 19: return "Pause";
	    case 20: return "CAPS";
	    case 27: return "Esc";
	    case 33: return "Page Up";
	    case 34: return "Page Down";
	    case 35: return "End";
	    case 36: return "Home";
	    case 37: return "Freccia Sinistra";
	    case 38: return "Freccia Su";
	    case 39: return "Freccia Destra";
	    case 40: return "Freccia Giu";
	    case 45: return "Insert";
	    case 46: return "Delete";
	    case 96: return "Numpad 0";
	    case 97: return "Numpad 1";
	    case 98: return "Numpad 2";
	    case 99: return "Numpad 3";
	    case 100: return "Numpad 4";
	    case 101: return "Numpad 5";
	    case 102: return "Numpad 6";
	    case 103: return "Numpad 7";
	    case 104: return "Numpad 8";
	    case 105: return "Numpad 9";
	    case 106: return "Numpad *";
	    case 107: return "Numpad +";
	    case 109: return "Numpad -";
	    case 110: return "Numpad .";
	    case 111: return "Numpad /";
	    case 112: return "F1";
	    case 113: return "F2";
	    case 114: return "F3";
	    case 115: return "F4";
	    case 116: return "F5";
	    case 117: return "F6";
	    case 118: return "F7";
	    case 119: return "F8";
	    case 120: return "F9";
	    case 121: return "F10";
	    case 122: return "F11";
	    case 123: return "F12";
	    case 144: return "Num Lock";
	    case 145: return "Scroll Lock";
	    case 186: return ";";
	    case 187: return "=";
	    case 188: return ",";
	    case 189: return "-";
	    case 190: return ".";
	    case 192: return "`";
	    case 219: return "/";
	    case 220: return "[";
	    case 221: return "]";
	    case 222: return "'";
	}
}

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