//sprite_index = noone;

hsp = 0;
dir = 1;
vsp = 0;
movespd = 1; //Attenzione, con i decimali fallisce il controllo verticale
active = true;

startx = x
starty = y
minx=x;
miny=y;
maxx=x+sprite_width
i=0;

left_d = 0;
while !(instance_place(x+left_d,y,obj_solid)) {
	left_d--;
}

up_d = 0;
while !(instance_place(x,y-up_d,obj_solid)) {
	up_d--;
}

