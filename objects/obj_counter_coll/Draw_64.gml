txt1 = ""
col = "[#FFFFFF]"
if (room == rm_lv3) {
	col = "[#000000]"
} 

if (count_taken  != count_total) {
	txt1 = col+"[pulse]"+string(count_taken)+"[/pulse]" ;
} else {
	txt1 = col+string(count_taken) ;
}

txt = col+"[fa_center][fa_right][scale,.5]"+txt1+ " / " + string(count_total);
scribble(txt).draw(240, 10)