//sprite_index = noone;

hsp = 0;
dir = 1;
vsp = 0;
movespd = 1; //Attenzione, con i decimali fallisce il controllo verticale

minx=x;
maxy=y;
i=0;

for (i=0; i<200; i++) {
	if place_meeting(x-i,y,obj_solid) {
		minx=x-i;
		break;
	}
}