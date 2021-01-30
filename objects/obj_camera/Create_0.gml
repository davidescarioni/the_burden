cam = view_camera[0];
follow = obj_player;
view_w_half = camera_get_view_width(cam) * 0.5; // "Half" perchè il personaggio sarà al centro
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

xmin = view_w_half;
ymin = view_h_half;
xmax = room_width - view_w_half;
ymax = room_height - view_h_half;