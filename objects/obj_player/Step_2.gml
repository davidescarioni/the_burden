onGround = false;
onWall = place_meeting(x + 1, y, obj_solid) && !onGround || place_meeting(x - 1, y, obj_solid) && !onGround;

scr_input();

onGround = place_meeting(x,y+1,obj_solid);

if instance_exists(obj_semi_solid) {
	with (obj_semi_solid) {
		if place_meeting(x,y-1,other) && !place_meeting(x,y,other) {
			other.onGround = true;
		} 
	}
}

//Movement
if (!move_lock) {
	move = kRight - kLeft;
}

//Jump
if (kJump) {
	buffer_counter = buffer_max;
} 

if(kJumpReleased) {
	if (vsp != jumpsp) && vsp < 0 {
		vsp /= 4;
	}
}

if (buffer_counter > 0) {
	buffer_counter -= 1;
	
	// "Normal Jump"
	if (onGround) {
		vsp +=  jumpsp;
		buffer_counter = 0;
	}
	
	if place_meeting(x + 1, y, obj_solid) && !onGround {
	    vsp = jumpsp;
	    move = -1*1.5;
	    move_lock = true;
	    alarm[0] = move_lock_time;
		buffer_counter = 0;
	}
	
	if place_meeting(x - 1, y, obj_solid) && !onGround {
	    vsp = jumpsp;
	    move = 1*1.5;
	    move_lock = true;
	    alarm[0] = move_lock_time;
		buffer_counter = 0;
	}
	
}

hsp = move * walksp;
vsp = vsp + grav;

scr_jumpThrougCollision(obj_semi_solid);

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

//y=round(y);

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
