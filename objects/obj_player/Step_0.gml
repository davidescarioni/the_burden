kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kJump = keyboard_check_pressed(ord("Z"));

// Movement
if (onGround) {
	vsp += kJump * jumpsp; 
}

//WallJump
if (!move_lock) {
	move = kRight - kLeft;
}

if (kJump) && place_meeting(x + 1, y, obj_solid) && !onGround {
    vsp = jumpsp;
    move = -1;
    move_lock = true;
    alarm[0] = move_lock_time;
}

if (kJump) && place_meeting(x - 1, y, obj_solid) && !onGround {
    vsp = jumpsp;
    move = 1;
    move_lock = true;
    alarm[0] = move_lock_time;
}

hsp = move * walksp;
vsp = vsp + grav;

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_solid)) {
	while (!place_meeting(x+sign(hsp),y,obj_solid)) {
		x+=sign(hsp)
	}
	hsp = 0;
}

x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_solid)) {
	while (!place_meeting(x,y+sign(vsp),obj_solid)) {
		y+=sign(vsp)
	}
	vsp = 0;
}

y += vsp;

//Animation
if (!onGround) {
	sprite_index = spr_player_jump;
	image_speed = 0;
	if (sign(vsp) > 0) {
		image_index = 1;
	} else {
		image_index = 0;
	}
} else {
	image_speed = 1;
	if (hsp==0) {
		sprite_index = spr_player_idle;
	} else {
		sprite_index = spr_player_run;
	}
}

if (hsp!=0) {
	image_xscale = sign(hsp);
}
