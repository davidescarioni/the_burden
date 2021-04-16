count_taken = 0;
with (obj_collectible) {
	if taken {
		other.count_taken+=1;
	}
}