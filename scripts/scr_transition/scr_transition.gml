function nextRoom(roomName) {
	var rm = roomName;
	var x1 = 0;
	var x2 = room_width;
	var y1 = 0;
	var y2 = room_height;
	var alpha = 0;
	alpha = (room_speed / 60) / 2
	draw_sprite_stretched_ext(spr_black,image_index,x1,y1,x2,y2,c_black,alpha)
	
	if alpha >=1 room_goto(rm);
}