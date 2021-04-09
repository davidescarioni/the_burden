switch(status) {
	case "one":
		if (x!=pos_x_one) {
			if x<=pos_x_one tmpx = 1
			else tmpx = -1;
		} else {
			tmpx = 0;
		}
		
		if (y!=pos_y_one) {
			if y<=pos_y_one tmpy = 1
			else tmpy = -1;
		} else {
			tmpy = 0;
		}
		
	break;
	
	case "two":
		if (x!=pos_x_two) {
			if x<=pos_x_two tmpx = 1
			else tmpx = -1;
		} else {
			tmpx = 0;
		}
		
		if (y!=pos_y_two) {
			if y<=pos_y_two tmpy = 1
			else tmpy = -1;
		} else {
			tmpy = 0;
		}
		
	break;
}

hsp = movespd * tmpx;
vsp = movespd * tmpy;

x+=hsp;
y+=vsp;