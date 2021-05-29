//sprite_index = noone;

hsp = 0;
dir = 1;
vsp = 0;
movespd = 1; //Attenzione, con i decimali fallisce il controllo verticale
active = true;
timer = 0;

startx = x
starty = y
minx=x;
miny=y;
maxx=x+sprite_width
i=0;
create_spring = false;
increased_value = current_time;
start_increased_value = increased_value

left_d = 0;
while !(instance_place(x+left_d,y,obj_solid)) {
	left_d--;
	if left_d < -512 {
		break;
	}
}

down_d = 0;
while !(instance_place(y+down_d,y,obj_solid)) {
	down_d--;
	if down_d < -512 {
		break;
	}
}