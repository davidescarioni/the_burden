if (taken) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, .5);
	if instance_exists(item) {
		instance_destroy(item);
	}
} else {
	draw_self();
}