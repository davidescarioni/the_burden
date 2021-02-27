//sprite_index = noone;

hsp = 0;
dir = 1;
vsp = 0;
movespd = 1; //Attenzione, con i decimali fallisce il controllo verticale

startx = x
starty = y
minx=x;
miny=y;
maxx=x+sprite_width
i=0;

for (i=0; i<250; i++) {
	minx=startx-i;
	if place_meeting(startx-i,y,obj_solid) {
		break;
	}
}

for (i=0; i<250; i++) {
	maxx=startx+i;
	if place_meeting(startx+i,y,obj_solid) {
		break;
	}
}