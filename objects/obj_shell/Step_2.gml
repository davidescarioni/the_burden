onGround = false;
onWall = place_meeting(x + 1, y, obj_solid) && !onGround || place_meeting(x - 1, y, obj_solid) && !onGround;

onGround = place_meeting(x,y+1,obj_solid);

if instance_exists(obj_semi_solid) {
	with (obj_semi_solid) {
		if place_meeting(x,y-1,other) && !place_meeting(x,y,other) {
			other.onGround = true;
		} 
	}
}

if (onGround) {
	hsp = clamp(hsp, 0, hsp - sign(hsp)*.5);
}
vsp = vsp + grav;

if (!place_meeting(x,y,obj_ladder)) {
	ladder = false;
	//hsp = move * walksp;
}

#region Semi Solid collision
if instance_exists(obj_semi_solid)  {
	scr_jumpThrougCollision(obj_semi_solid);
	
	with (obj_semi_solid) {
		if place_meeting(x,y-1,other) && !place_meeting(x,y,other) {
			other.onGround = true;
		} 
	}
}
#endregion

//Horizontal Collision
if place_meeting(x+hsp,y,obj_solid)
{
	// yplus logis is for slopes
    yplus = 0;
    while (place_meeting(x+hsp,y-yplus,obj_solid) && yplus <= abs(1*hsp)) yplus += 1;
    if place_meeting(x+hsp,y-yplus,obj_solid) {
        while (!place_meeting(x+sign(hsp),y,obj_solid)) x+=sign(hsp);
        hsp = 0;
    } else {
        y -= yplus
    }
}

//Vertical Collision
if (place_meeting(x,y+vsp,obj_solid)) {
	while (!place_meeting(x,y+sign(vsp),obj_solid)) {
		y+=sign(vsp)
	}
	vsp = 0;
}

//if (!place_meeting(x+other.hsp,y,obj_solid)) {
	if (place_meeting(x,y+1,obj_semi_solid) && !place_meeting(x,y,obj_semi_solid)) {
		var item = instance_place(x,y+1,obj_semi_solid)
		hsp=item.hsp;
	}
//}

//hsp = move * walksp;

x += hsp;

y += vsp;