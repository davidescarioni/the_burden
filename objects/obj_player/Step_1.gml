onGround = place_meeting(x,y+1,obj_solid);

onWall = place_meeting(x + 1, y, obj_solid) && !onGround || place_meeting(x - 1, y, obj_solid) && !onGround;