function scr_input(){
	kLeft = keyboard_check(vk_left);
	kRight = keyboard_check(vk_right);
	kDown = keyboard_check(vk_down);
	kUp = keyboard_check(vk_up);
	kJump = keyboard_check_pressed(ord("Z"));
	kJumpReleased = keyboard_check_released(ord("Z"));
	kReset = keyboard_check_pressed(ord("R"));
	kEject = keyboard_check_pressed(ord("X"));
	kLaunch = keyboard_check_pressed(ord("A"));
	kLift = keyboard_check_pressed(ord("C"))
}