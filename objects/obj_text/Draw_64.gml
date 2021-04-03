draw_set_color(c_orange);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_font(fnt_default);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message,1,textProgress);
draw_text(x1+8, y1+8, _print);
draw_set_color(c_white);
draw_text(x1+8, y1+7, _print);