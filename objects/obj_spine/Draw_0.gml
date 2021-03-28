if place_meeting(x,y+6,obj_solid) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha)
} else if place_meeting(x,y-6,obj_solid) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 180, c_white, image_alpha)
} else if place_meeting(x-6,y,obj_solid) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 270, c_white, image_alpha)
} else if place_meeting(x+6,y,obj_solid) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 90, c_white, image_alpha)
} else {
	draw_self();
}