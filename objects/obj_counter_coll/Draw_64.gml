txt1 = ""

if (count_taken  != count_total) {
	txt1 = "[pulse]"+string(count_taken)+"[/pulse]" ;
} else {
	txt1 = string(count_taken) ;
}

txt = "[fa_center][fa_right][scale,.5]"+txt1+ " / " + string(count_total);
scribble(txt).draw(240, 10)