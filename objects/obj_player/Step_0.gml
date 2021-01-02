kLeft = keyboard_check(vk_left);
kRight = keyboard_check(vk_right);
kJump = keyboard_check_pressed(ord("Z"));

// Movement
var move = kRight - kLeft;
hsp = move * walksp;
vsp = vsp + grav;

if place_meeting(x,y+1,obj_solid) {
	if (kJump) {
		vsp += jumpsp; 
	}
}

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