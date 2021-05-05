if buying exit;
if !instance_exists(obj_text) && !instance_exists(obj_text_queued) {
	reading = false;
}
if reading exit;

onGround = false;

onWall = place_meeting(x + 1, y, obj_solid) && !onGround || place_meeting(x - 1, y, obj_solid) && !onGround;


scr_input();

onGround = place_meeting(x,y+1,obj_solid) || 
		   (place_meeting(x,y+1,obj_semi_solid) && !place_meeting(x,y,obj_semi_solid)) || 
		   (place_meeting(x,y+1,obj_box) && !place_meeting(x,y,obj_box));

#region Enter Shop
if place_meeting(x,y,obj_fakedoor) && (keyboard_check_released(global.key_up)) {
	if (!buying) {
		buying = true;
		alarm[2]=room_speed;
		move_lock = true;
	}
}

#endregion

#region Movement
if (!move_lock) {
	move = kRight - kLeft;
	if (move != 0) && (onGround) {
		dust = true;
		dust_time = dust_time_ground
	}

	//Jump
	if ((kJump) && !place_meeting(x,y,obj_semi_solid)) || ((kJump) && onGround) {
		buffer_counter = buffer_max;
	} 

	if(kJumpReleased) {
		if (vsp != jumpsp) && vsp < 0 {
			vsp /= 4;
		}
	}
}

if (buffer_counter > 0) {
	buffer_counter -= 1;
	
	// "Normal Jump"
	if (onGround && !has_shell) {
		vsp +=  jumpsp;
		buffer_counter = 0;
		audio_sound_pitch(snd_jump,choose(.9,1,1.1));
		audio_play_sound(snd_jump,1,false);
		draw_yscale=1.20
        draw_xscale=.65
	}
	
	if place_meeting(x + 1, y, obj_solid) && !onGround && !has_shell {
	    vsp = jumpsp;
	    move = -1*1.5;
	    move_lock = true;
	    alarm[0] = move_lock_time;
		buffer_counter = 0;
		audio_sound_pitch(snd_jump,choose(.9,1,1.1));
		audio_play_sound(snd_jump,1,false);
	}
	
	if place_meeting(x - 1, y, obj_solid) && !onGround && !has_shell {
	    vsp = jumpsp;
	    move = 1*1.5;
	    move_lock = true;
	    alarm[0] = move_lock_time;
		buffer_counter = 0;
		audio_sound_pitch(snd_jump,choose(.9,1,1.1));
		audio_play_sound(snd_jump,1,false);
	}
	if instance_exists(obj_water) {
		if place_meeting(x,y,obj_water) && !has_shell {
			vsp = jumpsp*(2/3);
			onGround = true;
		}
	}
}

if (onGround) {
	move_lock = false;
}

if (!launch) {
	if move>0 {
		hsp = lerp(hsp, walksp, 0.05)
	} else if move < 0 {
		hsp = lerp(hsp, -walksp, 0.05)
	} else {
		hsp = 0;
	}
	//hsp = move * walksp;
	vsp = vsp + grav;
} else {
	hsp = 0;
}


if (vsp>0) && onWall {
	vsp = vsp*2/3;
	dust = true;
	dust_time = dust_time_wall;
} 
if onWall && onGround{
	dust = false;
}
#endregion

#region Ladders / Scale
if (kUp || kDown) && (place_meeting(x,y,obj_ladder) && ladder==false) {
	_inst = instance_place(x,y,obj_ladder);
	if abs(x - (_inst.x)) <= d_to_ladder {
	// TODO: FIX
	//	var s = 1; //hsp sign
	//	if (x<=_inst.x) {
	//		s = 1;
	//	}
	//	if (x>_inst.x) {
	//		s=-1;
	//	}
	//	hsp = .5*s;
	//	vsp = 0;
	//	move_lock = true;
	//}
	//if (x==_inst.x) {
		hsp = 0;
		x=_inst.x;
		ladder = true;
		move_lock = false;
	}
}

if (!place_meeting(x,y,obj_ladder)) {
	ladder = false;
	//hsp = move * walksp;
}

if (ladder) {
	vsp = 0;
	hsp = 0;
	if (kUp) {
		vsp = -1;
	}
	if (kDown) {
		vsp = +1;
	}
	if (kJump) {
		ladder = false;
	}
	if (!place_meeting(x,y,obj_ladder)) {
		ladder = false;
	}
}
#endregion

#region Semi Solid collision
if instance_exists(obj_semi_solid) && (ladder==false) {
	if (!keyboard_check(global.key_down)) {
		scr_jumpThrougCollision(obj_semi_solid);
	}
	
	with (obj_semi_solid) {
		if place_meeting(x,y-1,other) && !place_meeting(x,y,other) {
			other.onGround = true;
		} 
	}
}
#endregion

#region Collisioni

//Horizontal Collision
if place_meeting(x+hsp,y,obj_solid)
{
	// yplus logic is for slopes
    yplus = 0;
    while (place_meeting(x+hsp,y-yplus,obj_solid) && yplus <= abs(1*hsp)) yplus += 1;
    if place_meeting(x+hsp,y-yplus,obj_solid) {
        while (!place_meeting(x+sign(hsp),y,obj_solid)) x+=sign(hsp);
        hsp = 0;
    } else {
        y -= yplus
    }
}

if instance_exists(obj_block_wshell) {
	if place_meeting(x+hsp,y,obj_block_wshell) {
		var block = instance_place(x+hsp,y,obj_block_wshell);
		if !block.player_has_shell {
		    while (!place_meeting(x+sign(hsp),y,obj_block_wshell)) x+=sign(hsp);
		    hsp = 0;
		}
	}
}


//if place_meeting(x+hsp,y,obj_spring) {
//    while (!place_meeting(x+sign(hsp),y,obj_spring)) {
//		x+=sign(hsp);
//	}
//	hsp = 0
//}

x += hsp;

// Smooth Slopes Down
if !place_meeting(x,y,obj_solid) && vsp >= 0 && place_meeting(x,y+2+abs(hsp),obj_solid) {
	while(!place_meeting(x,y+1,obj_solid)) {
		y += 1;
	}
}

//Vertical Collision
if (place_meeting(x,y+vsp,obj_solid)) {
	while (!place_meeting(x,y+sign(vsp),obj_solid)) {
		y+=sign(vsp)
	}
	vsp = 0;
}

if instance_exists(obj_box) {
	if (place_meeting(x,y+vsp,obj_box)) && !place_meeting(x,y,obj_box) {
		while (!place_meeting(x,y+sign(vsp),obj_box)) {
			y+=sign(vsp)
		}
		vsp = 0;
		onGround = true;
	}
}

if instance_exists(obj_block_wshell) {
	if place_meeting(x,y+vsp,obj_block_wshell) {
		var block = instance_place(x,y+vsp,obj_block_wshell);
		if !block.player_has_shell {
		    while (!place_meeting(x,y+sign(vsp),obj_block_wshell)) y+=sign(vsp);
		    vsp = 0;
		}
	}
}

if (place_meeting(x,y+vsp,obj_spring) && vsp > 0 && !place_meeting(x,y,obj_spring)) && !death {
	var inst = instance_place(x,y+vsp,obj_spring);
	with (inst) {
		coll = true;
		alarm[0] = 5;
		if !audio_is_playing(snd_bonk) {
			audio_play_sound(snd_bonk,1,false)
		}
	}
	while (!place_meeting(x,y+sign(vsp),obj_spring)) {
		y+=sign(vsp)
	}
	vsp = inst.jumpPower;
}
if instance_exists(obj_waterballs) {
	if place_meeting(x,y,obj_waterballs) && !has_shell {
		vsp = jumpsp/2;
	}
}

y += vsp;

#endregion

#region Animazioni

draw_xscale = lerp(draw_xscale, 1, .1)
draw_yscale = lerp(draw_yscale, 1, .1)

if (has_shell) {
	if (ladder) {
		sprite_index = spr_player_ladder;
	} else {
		if (!onGround) {
			sprite_index = spr_player_jump;
			image_speed = 0;
			if (sign(vsp) > 0) {
				image_index = 1;
			} else {
				image_index = 0;
			}
			if (vsp>0) && onWall {
				sprite_index = spr_player_wall
			}
		} else {
			image_speed = 1;
			if (hsp==0) {
				sprite_index = spr_player_idle;
			} else {
				sprite_index = spr_player_run;
			}
		}
	}
} else {
	if (ladder) {
		sprite_index = spr_player_nake_ladder;
	} else {
		if (!onGround) {
			sprite_index = spr_player_nake_jump;
			image_speed = 0;
			if (sign(vsp) > 0) {
				image_index = 1;
			} else {
				image_index = 0;
			}
			if (vsp>0) && onWall {
				sprite_index = spr_player_nake_wall
			}
		} else {
			image_speed = 1;
			if (hsp==0) {
				sprite_index = spr_player_nake_idle;
			} else {
				sprite_index = spr_player_nake_run;
			}
		}
	}
}

if (hsp!=0) {
	image_xscale = sign(hsp);
}
#endregion

#region Sfx
if (dust) {
	if (do_dust) {
		alarm[1] = dust_time;
		do_dust = false;
	}
}
#endregion

#region Remove shell
if kEject && can_remove_shell {
	if (instance_exists(obj_block_wshell) && !place_meeting(x,y,obj_block_wshell)) || !instance_exists(obj_block_wshell) {
		if has_shell {
			has_shell = false
			if !layer_exists("Shell") {
				layer_create(1,"Shell");
			}
			instance_create_layer(x,y,"Shell",obj_shell);
		} else if !(has_shell) && (distance_to_object(obj_shell) < 5) {
			has_shell = true;
			with (obj_shell) {
				instance_destroy(obj_shell);
			}
		}
	
		if (launch) {
			launch = false;
			move_lock = false;
		}
	}
}
#endregion

#region Lift Object
if kLift {
	if (!lifting) {
		if place_meeting(x,y,obj_box) {
			var inst = instance_place(x,y,obj_box)
			with (inst) {
				lifted = true;
				other.lifting = true;
			}
		}
	} else if (lifting) {
		if place_meeting(x,y,obj_box) {
			var inst = instance_place(x,y,obj_box)
			with (inst) {
				lifted = false;
				other.lifting = false;
				x+=sign(other.image_xscale)*2
			}
		}
	}
	if place_meeting(x,y,obj_activator) {
		var inst = instance_place(x,y,obj_activator)
		with (inst) {
			alarm[0] = 1;
		}
	}
}
#endregion

#region Launch object
if (kLeft && launch) {
	rot+=5;
}
if (kRight && launch) {
	rot-=5;
}

if (has_shell) {
	if (kLaunch && launch) {
		has_shell = false;
		var shell = instance_create_layer(x,y,"Player",obj_shell);
		with (shell) {
			dir = other.rot;
			spd = walksp*3.5;
			move = 1
			vsp = lengthdir_y(spd, dir);
			hsp = lengthdir_x(spd, dir);
		}
	}

	if (kLaunch) && (onGround) && (can_launch_shell) {
		if (!launch) {
			launch = true;
			move_lock = true;
			if (image_xscale==-1) {
				rot = 180;
			} else {
				rot = 0;
			}
		} else if (launch) {
			launch = false;
			move_lock = false;
		}
	}
	
	if (launch) && (kJump) {
		launch = false;
		move_lock = false;
	}
}
#endregion

#region Camera
if instance_exists(obj_room_camera) {
	if place_meeting(x,y,obj_room_camera) {
		oCam = instance_position(x,y,obj_room_camera);
		if (oCam != noone) && (oCam != oldCam) {
			oldCam = oCam;
			with (obj_camera) {
				camera = other.oCam;
				
				cwidth = camera.camera_width * camera.image_xscale
				cheight = camera.camera_height * camera.image_yscale

				xmin = camera.x + view_w_half;
				ymin = camera.y + view_h_half;
				xmax = camera.x + cwidth - view_w_half;
				ymax = camera.y + cheight - view_h_half;
			
				// Force the camera to stay inside the obj camera room
				x = clamp(x,xmin,xmax);
				y = clamp(y,ymin,ymax);

			}
		} 
		// Camera "normale" segue il giocatore
		//else {
		//	with (obj_camera) {
		//		xmin = view_w_half;
		//		ymin = view_h_half;
		//		xmax = room_width - view_w_half;
		//		ymax = room_height - view_h_half;
		//	}
		//}
	}
}
#endregion

#region Debug
if kReset {
	room_restart();
}
#endregion

#region Light
if (room==rm_lv1) {
	light.x = x;
	light.y = y+2;
}
#endregion

#region Death
if place_meeting(x,y,obj_enemies) {
	move_lock = true;
	death_x = x;
	death_y = y;
	death = true;
	hsp = 0;
	vsp = 0;
	loadCollectibles();
}
#endregion