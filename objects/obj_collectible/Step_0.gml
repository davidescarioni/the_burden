if place_meeting(x,y,obj_player) && !taken && !obj_player.death {
	taken = true;
	if !audio_is_playing(snd_collect) {
		audio_play_sound(snd_collect,1,false);
	}
} 
//if !taken {
	//y  = yTo + sin(timer * 0.1) * 0.25;
	y+=sin(timer*0.1)*0.25
	timer++;
//}

//if instance_exists(item) item.y = y;



//if instance_exists(obj_counter_coll) {
//	if taken && !counted {
//		obj_counter_coll.count_taken += 1;
//		counted = true;
//	}
//}