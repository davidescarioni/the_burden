txt1="[wave][fa_center][fa_middle]The End[/wave]";
txt3="";
if (global.completeLevel1 && global.completeLevel2 && global.completeLevel3) {
	txt3="[fa_center][fa_middle][scale,.5]Hai sbloccato la ricetta[nbsp] dei Tartascotti!"
} else {
	txt3="[fa_center][fa_middle][scale,.5]Raccogli tutte le mele per[nbsp]sbloccare la ricetta dei Tartascotti!"
}

txt = "[fa_center][fa_middle][scale,.5]"+key_to_string(global.key_up);
scribble(txt1).draw(room_width/2, (room_height / 2) - 20);
scribble(txt3).draw(room_width/2,( room_height / 2)+20).wrap(room_width);