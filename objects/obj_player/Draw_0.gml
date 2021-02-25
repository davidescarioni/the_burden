if (launch) {
	//Draw Arrow
	ii+=.2
	draw_sprite_ext(spr_arrow,ii,x,y,1,1,rot,c_white,1);
}
//Draw Turtles
draw_self()

//Draw debu test
if (oCam != noone) {
draw_text(obj_camera.xmin+10, obj_camera.y+10, "move lock: " + string(move_lock))
draw_text(obj_camera.xmin+10, obj_camera.y+20, "ladder: " + string(ladder))
}