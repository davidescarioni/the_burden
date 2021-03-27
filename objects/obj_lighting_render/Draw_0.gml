if (!surface_exists(lighting_surface)) {
	lighting_surface = surface_create(room_width, room_height);
}

surface_set_target(lighting_surface);

draw_clear_alpha(c_black,.6);

with(obj_lighting_cutout) {
	
	var wobble_amount_x = image_xscale + random_range(-wobble, wobble);
	var wobble_amount_y = image_yscale + random_range(-wobble, wobble);;
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_amount_x, wobble_amount_y, 0, c_white, 1);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_amount_x, wobble_amount_y, 0, color, intensity);
	gpu_set_blendmode(bm_normal);
}

surface_reset_target();

draw_surface(lighting_surface,0,0);