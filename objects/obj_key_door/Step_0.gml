if (open) {
	switch (opening_direction) {
		case "top":
			if (y>(ystart-hgt)) {
				y-=1;
			}
		break;
		
		case "bottom":
			if (y<(ystart+hgt)) {
				y+=1;
			}
		break;
		
		case "left":
			if (x>(xstart-wdt)) {
				x-=1;
			}
		break;
		
		case "right":
			if (x<(xstart+wdt)) {
				x+=1;
			}
		break;
	}
}