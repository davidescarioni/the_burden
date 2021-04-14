event_inherited();

// Animate variables
coll = false;
draw_xscale = 1;
draw_yscale = 1;

jumpPower = -7

hsp = 0;
dir = 1;
vsp = 0;
movespd = 1; //Attenzione, con i decimali fallisce il controllo verticale

left_d = 0;
while !(instance_place(x+left_d,y,obj_solid)) {
	left_d--;
	if left_d < -256 {
		break;
	}
}