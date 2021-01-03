cam = view_camera[0];
follow = obj_player;
view_w_half = camera_get_view_width(cam) * 0.5; // "Half" perchè il personaggio sarà al centro
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;