function scr_input(){
	kLeft = keyboard_check(vk_left);
	kRight = keyboard_check(vk_right);
	kDown = keyboard_check(vk_down);
	kJump = keyboard_check_pressed(ord("Z"));
	kJumpHeld = keyboard_check(ord("Z"));
}