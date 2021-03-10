if (coll == true) {
	draw_yscale=2.50
	draw_xscale=1.65
} else {
	draw_xscale = lerp(draw_xscale, 1, .1);
	draw_yscale = lerp(draw_yscale, 1, .1);
}