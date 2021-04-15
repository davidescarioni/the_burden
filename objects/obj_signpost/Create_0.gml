txt = "[wave][fa_center][fa_middle][scale,.5]"+key_to_string(global.key_up);

txt_wt = scribble(txt).get_width();
txt_wt_max = 100
wt = min(txt_wt,txt_wt_max);
times = ceil(txt_wt / txt_wt_max)
ht = scribble(txt).get_height() * times
pd = 2; //Padding
max_dist = 7;