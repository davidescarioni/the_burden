//if (taken) {
//	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_gray, .5);
//	if instance_exists(item) {
//		instance_destroy(item);
//	}
//} else {
	
//}

if sprite_index == spr_collectible {
	draw_self();
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,rot,image_blend,image_alpha);
	rot+=10;
	
	if (image_index >= image_number - 1) {
		instance_destroy()
	}
}