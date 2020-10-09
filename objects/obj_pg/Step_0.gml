scr_input();

if keyboard_check(key_left) {
	spd_x = max(spd_x - acc, -spd_x_max);
	//status = "move"
}

if keyboard_check(key_right) {
	spd_x = min(spd_x + acc, spd_x_max);
	//status = "move"
}

if !keyboard_check(key_left) && !keyboard_check(key_right) {
	spd_x *= 1 - damp;
	//status = "idle"

}
if !place_meeting(x, y+1, obj_block) {
	spd_y = min(spd_y + grav, spd_y_max);
	on_ground = false
} else {
	on_ground = true
}

if (on_ground && keyboard_check_pressed(key_jump)) {
	spd_y = jump;
}

var collision_x = instance_place(x + spd_x, y, obj_block);
var collision_y = instance_place(x, y + spd_y, obj_block);

next_right = instance_place(ceil(bbox_right) + 1, y, obj_block);
next_left = instance_place(bbox_left - 1, y, obj_block);


if collision_x != noone {
	if spd_x > 0 {
		x = collision_x.bbox_left - (bbox_right + 1 - x);
	}
	
	if spd_x < 0 {
		x = collision_x.bbox_right + 1 + (x - bbox_left);
	}
	
	spd_x = 0;
	
	if status="falling" {
		spd_y = spd_y / 2
	}
	
	
	
	if (!on_ground && keyboard_check_pressed(key_jump)) {
		spd_y = jump
		spd_x = (keyboard_check(key_left) - keyboard_check(key_right)) * spd_x_max
	}
}

if collision_y != noone {
	if spd_y > 0 {
		y = collision_y.bbox_top - (bbox_bottom + 1 - y);
	}
	
	if spd_y < 0 {
		y = collision_y.bbox_bottom + 1 + (y - bbox_top);
	}
	
	spd_y = 0; 
}

if spd_y > 0 status = "falling";
if spd_y < 0 status = "jumping";
if spd_y == 0 status = "0"


x += spd_x;
y += spd_y; 