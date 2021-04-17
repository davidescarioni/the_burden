if instance_exists(obj_player) {
	if !obj_player.reading {
		if place_meeting(x,y,obj_player) && keyboard_check_released(global.key_up) {
			obj_player.reading = true;
			if global.tasklvl2 = false {
				newTextBox("Aiutami tartaruga!",c_dkgray,spr_thumb_merlo);
				newTextBox("?? Cos'è successo?",c_green,spr_thumb_turtle);
				newTextBox("Stavo consegnando un regalo, ma mi è caduto nel lago qui sotto!",c_dkgray,spr_thumb_merlo);
				newTextBox("Tu che puoi andare a fondo con il tuo guscio, riusciresti a recuperarlo?",c_dkgray,spr_thumb_merlo);
				newTextBox("Mi sdebiterò aprendoti la porta alle mie spalle!",c_dkgray,spr_thumb_merlo);
			} else {
				newTextBox("Grazie mille tartaruga!",c_dkgray,spr_thumb_merlo);
				newTextBox("Fortuna che tu hai un guscio, non come le mie inutili penne nere!",c_dkgray,spr_thumb_merlo);
				newTextBox("Come promesso ti apro la porta, grazie ancora!",c_dkgray,spr_thumb_merlo);
				newTextBox("(Fortuna che ho un guscio? Sta scherzando?)",c_green,spr_thumb_turtle);
				with (inst_1784AAC0) {
					open = true;
				}
			}
		}
	}
}