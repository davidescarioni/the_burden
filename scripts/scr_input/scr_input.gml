function scr_input(){
	kLeft = keyboard_check(global.key_left) ;
	kRight = keyboard_check(global.key_right);
	kDown = keyboard_check(global.key_down);
	kUp = keyboard_check(global.key_up);
	kJump = keyboard_check_pressed(ord("Z"));
	kJumpReleased = keyboard_check_released(ord("Z"));
	kReset = keyboard_check_pressed(ord("R"));
	kEject = keyboard_check_pressed(ord("X"));
	kLaunch = keyboard_check_pressed(ord("A"));
	kLift = keyboard_check_pressed(ord("C"))
	kPause = keyboard_check_released(vk_escape)
}