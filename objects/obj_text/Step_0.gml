lerpProgress += (1-lerpProgress) / 50;

if (y1 == y1Target) && (y2 == y2Target) {
	textProgress += global.textSpeed;
}

y1 = lerp(y1,y1Target,lerpProgress);
y2 = lerp(y2,y2Target,lerpProgress);

if (keyboard_check_pressed(global.key_jump)) {
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength) {
		instance_destroy();
		if instance_exists(obj_text_queued) {
			with (obj_text_queued) ticket--;
		}
	} else {
		if (textProgress > 2) {
			textProgress = _messageLength;
		}
	}
}