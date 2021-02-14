function scr_input(){
	kLeft = keyboard_check(global.key_left) ;
	kRight = keyboard_check(global.key_right);
	kDown = keyboard_check(global.key_down);
	kUp = keyboard_check(global.key_up);
	kJump = keyboard_check_pressed(global.key_jump);
	kEnter = kJump
	kJumpReleased = keyboard_check_released(global.key_jump);
	kReset = keyboard_check_pressed(ord("R"));
	kEject = keyboard_check_pressed(global.key_eject);
	kLaunch = keyboard_check_pressed(global.key_launch);
	kLift = keyboard_check_pressed(global.key_lift)
	kPause = keyboard_check_released(vk_escape)
}