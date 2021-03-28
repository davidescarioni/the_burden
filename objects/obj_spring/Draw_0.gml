if (jumpPower == -5.5) {
	image_index = 0;
} else {
	image_index = 1;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);