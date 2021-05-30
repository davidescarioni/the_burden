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
	draw_set_valign(fa_center)
	var nome = "";
	if (i==1) {
		nome = "La scorciatoia"
	}
	if (i==2) {
		nome = "Grotta Azzurra"
	}
	if (i==3) {
		nome = "Grande Cima"
	}
	draw_text(40,h*i,nome);
	var spr = spr_collectible_menu;
	var xpos = 30;
	if i == 1 && global.completeLevel1 {
		draw_sprite_ext(spr,image_index,xpos,h+2*i,image_xscale, image_yscale, image_angle, image_blend, 1)
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