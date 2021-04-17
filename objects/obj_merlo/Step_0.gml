if instance_exists(obj_player) {
	if !obj_player.reading {
		if place_meeting(x,y,obj_player) && keyboard_check_released(global.key_up) {
			obj_player.reading = true;
			var col = $404493
			if global.tasklvl2 = false {
				newTextBox("Aiutami tartaruga!",col,spr_thumb_signpost);
				newTextBox("?? Cos'è successo?",col,spr_thumb_signpost);
				newTextBox("Stavo consegnando un regalo, ma mi è caduto nel lago qui sotto!",col,spr_thumb_signpost);
				newTextBox("Tu che puoi andare a fondo con il tuo guscio, riusciresti a recuperarlo?",col,spr_thumb_signpost);
				newTextBox("Mi sdebiterò aprendoti la porta alle mie spalle!",col,spr_thumb_signpost);
			} else {
				newTextBox("Grazie mille tartaruga!",col,spr_thumb_signpost);
				newTextBox("Fortuna che tu hai un guscio, non come le mie inutili penne nere!",col,spr_thumb_signpost);
				newTextBox("Come promesso ti apro la porta, grazie ancora!",col,spr_thumb_signpost);
				newTextBox("(Fortuna che ho un guscio? Sta scherzando?)",col,spr_thumb_signpost);
			}
		}
	}
}