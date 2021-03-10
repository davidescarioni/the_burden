if (launch) {
	//Draw Arrow
	ii+=.2
	draw_sprite_ext(spr_arrow,ii,x,y,1,1,rot,c_white,1);
}

//Draw Turtles
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * draw_xscale, draw_yscale, image_angle, image_blend, image_alpha)