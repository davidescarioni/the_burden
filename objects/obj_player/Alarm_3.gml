/// @description Bubbles!
if place_meeting(x,y,obj_water) {
	instance_create_depth(x+image_xscale,y,-10, obj_bubbles);
	alarm[3]=choose(room_speed/2,room_speed/3);
	bubbling = false;
}