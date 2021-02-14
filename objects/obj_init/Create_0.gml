/// Initialize Scribble
scribble_font_add("fnt_default");

global.pause = false;
global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;
global.key_jump = ord("Z");
global.key_eject = ord("X");
global.key_launch = ord("A");
global.key_lift = ord("C");

/// Load saved settings
load_data();

if !layer_exists("Pause") {
	layer_create(10,"Pause");
}
instance_create_layer(x,y,"Pause",obj_menu)