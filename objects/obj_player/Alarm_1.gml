/// @description Do Dust on Wall
if place_meeting(x + 1, y, obj_solid) instance_create_layer(x+5,y,"Player",obj_dust);
if place_meeting(x - 1, y, obj_solid) instance_create_layer(x-5,y,"Player",obj_dust);
if !onWall && onGround {
	var d = instance_create_layer(x,y+10,"Player",obj_dust);
	d.sprite_index = spr_dust_ground;
}

do_dust = true;
dust = false;