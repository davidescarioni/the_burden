if (launch) {
	//Draw Arrow
	ii+=.2
	draw_sprite_ext(spr_arrow,ii,x,y,1,1,rot,c_white,1);
}

//Draw Turtles
draw_self()

draw_text(x,y+10,global.lastCheckpointX);