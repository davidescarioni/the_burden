draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var h = room_height / 4;

if (global.specialLevel) {
	var h = room_height / 5;
} 

for (i=1; i<=max_sel; i++) {
	if sel==i {
		draw_set_color(c_orange)
	} else {
		draw_set_color(c_white)
	}
	draw_text(20,h*i,"Level " + string(i));
	var spr = spr_collectible;
	var xpos = 90;
	if i == 1 && global.completeLevel1 {
		draw_sprite_ext(spr,image_index,xpos,h*i,image_xscale, image_yscale, image_angle, image_blend, 1)
	} else if i == 2 && global.completeLevel2 {
		draw_sprite_ext(spr,image_index,xpos,h*i,image_xscale, image_yscale, image_angle, image_blend, 1)
	} else if i == 3 && global.completeLevel3 {
		draw_sprite_ext(spr,image_index,xpos,h*i,image_xscale, image_yscale, image_angle, image_blend, 1)
	} else {
		draw_sprite_ext(spr,image_index,xpos,h*i,image_xscale, image_yscale, image_angle, c_black, .5)
	}
}

//RESET
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_color(c_white);