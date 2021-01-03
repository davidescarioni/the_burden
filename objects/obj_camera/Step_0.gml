// Update Destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

// Force the camera to stay inside the room
x = clamp(x,view_w_half,room_width - view_w_half);
y = clamp(y,view_h_half,room_height - view_h_half);

// Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half)

if (layer_exists("ThirdBk")) {
	layer_x("ThirdBk",x/2);
}

if (layer_exists("SecondBk")) {
	layer_x("SecondBk",x/4);
}