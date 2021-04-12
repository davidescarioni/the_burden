draw_set_color(col);
draw_rectangle(x1,y1,x2,y2,false);
draw_set_font(fnt_game);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);

draw_sprite(spr,-1,x1+8,y1+8);
maxWidth = x2-8-8-8-34;
stringHeight = string_height(message)
//var _print = string_copy(message,1,textProgress);
//draw_text_ext(x1+8+34+8, y1+11, _print, stringHeight, maxWidth);
//draw_set_color(c_white);
//draw_text_ext(x1+8+34+8, y1+10, _print, stringHeight, maxWidth);

scribble("[scale,.5]"+message).typewriter_in(0.5,1).wrap(maxWidth).draw(x1+8+34+8, y1+10)