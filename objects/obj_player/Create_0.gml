hsp = 0;
vsp = 0;
grav = 0.3;
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

// Double Jump Lock
move_lock = false;
move_lock_time = 10

// Jump buffer
buffer_counter = 0;
buffer_max = 6;

// Launch object
launch = false;
rot = 0
ii = 0

// Camera set
oldCam = noone;