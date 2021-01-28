draw_self();
direction_to_mouse = point_direction(x, y, mouse_x, mouse_y);
speed_you_want = walksp;
draw_text(x,y-20,direction_to_mouse);
draw_text(x,y-10,lengthdir_x(speed_you_want, direction_to_mouse));