draw_self();

if instance_exists(obj_player) {
	dist = distance_to_object(obj_player);
	if (dist < max_dist) {
		//Draw background
		var _y = y-20;
		var _x = x
		var _xleft = _x - wt/2 - pd;
		var _yleft = _y-ht/2 - pd;
		var _xright = _x + wt/2 + pd;
		var _yright = _y+ht/2 + pd;
		
		draw_set_alpha(1/(dist+1))
		draw_set_color(c_black);
		draw_roundrect(_xleft,_yleft,_xright,_yright,false);
		draw_set_alpha(1)

		//Draw Text
		scribble(txt).draw(x, y-20).blend(c_white,1/(dist+1)).wrap(txt_wt_max);
	}
}

