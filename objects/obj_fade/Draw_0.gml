a = clamp(a + (fade * 0.005), 0, 1);

if (a == 1) {
	room_goto(rm);
	fade = -1;
}

if (a==0) && (fade==-1) {
	instance_destroy();
}

draw_set_color(c_black);
draw_set_alpha(a);
draw_rectangle(0,0,room_width,room_height,false);
draw_set_alpha(1);