if (coll == true) {
	draw_yscale=1.7
	draw_xscale=0.65
} else {
	draw_xscale = lerp(draw_xscale, 1, .1);
	draw_yscale = lerp(draw_yscale, 1, .1);
}

if (place_meeting(x,y+1,obj_semi_solid) && !place_meeting(x,y,obj_semi_solid)) {
	var item = instance_place(x,y+1,obj_semi_solid)
	hsp=item.hsp;
	vsp=item.vsp;
}



x += hsp;
y += vsp;