count_taken = 0;
with (obj_collectible) {
	if taken {
		other.count_taken+=1;
	}
}

if (count_taken  == count_total) {
	if room=rm_lv1 global.completeLevel1 = true;
	if room=rm_lv2 global.completeLevel2 = true;
	if room=rm_lv3 global.completeLevel3 = true;
}