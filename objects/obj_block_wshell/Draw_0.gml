if alpha < alpha_temp alpha+=0.01;
if alpha > alpha_temp alpha-=0.01;
if !player_has_shell {
	if alpha == alpha_temp alpha_temp = choose(0.3,0.6);
} else {
	alpha_temp = 0;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, alpha)