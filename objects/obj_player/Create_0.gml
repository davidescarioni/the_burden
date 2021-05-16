hsp = 0;
vsp = 0;
grav = 0.25;
walksp = 2;
jumpsp = -4;
acc = 0.02;
onGround = false;
has_shell = true;
lifting = false;
ladder = false;
d_to_ladder = 5;
text=""
state = "shellState"
dust = false;
do_dust = true;
dust_time_wall = 10
dust_time_ground = 5
dust_time = 5;
buying = false;
reading = false;
can_remove_shell = false;
bubbles = false;
bubbling= false;
if (room!=rm_lv1) {
	can_remove_shell = true;
}
can_launch_shell = false;
if (room==rm_lv3) {
	can_launch_shell = true;
}

// Double Jump Lock
move_lock = false;
move_lock_time = 10

// Jump buffer
buffer_counter = 0;
buffer_max = 1;

//Animate
draw_xscale = 1
draw_yscale = 1

// Launch object
launch = false;
rot = 0
ii = 0

// Camera set
oCam = noone;
oldCam = noone;

//Death
drawCircle = true;
drawCircleDim = 350;
death = false;
drawDeathCircleDim = 0;

//if (global.load) {
//	x = global.lastCheckpointX;
//	y = global.lastCheckpointY;
//	global.load = false;
//}

// Level Variables
light = noone;
if (room==rm_lv1) {
	light = instance_create_layer(x,y,"Camera",obj_lighting_cutout);
	light.image_xscale = 1.5
	light.image_yscale = 1.5
}