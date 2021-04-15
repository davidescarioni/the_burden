if buying exit;

if (launch) {
	//Draw Arrow
	ii+=.2
	draw_sprite_ext(spr_arrow,ii,x,y,1,1,rot,c_white,1);
}

//Draw Turtles
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * draw_xscale, draw_yscale, image_angle, image_blend, image_alpha);

//Draw Respawn Circle
if drawCircle && drawCircleDim > 0 {
	draw_set_color(c_black);
	draw_circle(x,y,drawCircleDim,false);
	drawCircleDim-=10;
} else {
	drawCircleDim = 350;
	drawCircle = false;
}

if death {
	draw_set_color(c_black);
	draw_circle(death_x,death_y,drawDeathCircleDim,false);
	drawDeathCircleDim+=5;
	if (drawDeathCircleDim >= drawCircleDim) {
		if light != noone {
			with (light) {
				instance_destroy();
			}
		}
		with (obj_shell) {
			instance_destroy();
		}
		//x = global.lastCheckpointX;
		//y = global.lastCheckpointY;
		//death = false;
		//drawDeathCircleDim = 0;
		instance_destroy();
		instance_create_layer(global.lastCheckpointX,global.lastCheckpointY,"Player",obj_player)
		//instance_change(obj_player, true);
	}
}