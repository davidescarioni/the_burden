global.pause = true;
global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.key_revert = ord("x");
global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;

display_set_gui_size(global.view_width, global.view_height);

enum menu_page {
	main,
	settings,
	audio,
	graphics,
	controls,
	height
}
 
enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}
 
// Create Menu Pages
ds_menu_main = create_menu_page(
	["RESUME", menu_element_type.script_runner, resume_game],
	["SETTINGS", menu_element_type.page_transfer, menu_page.settings],
	["EXIT", menu_element_type.script_runner, exit_game]
);
 
ds_settings = create_menu_page(
	["AUDIO", menu_element_type.page_transfer, menu_page.audio],
	["GRAPHICS", menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLS", menu_element_type.page_transfer, menu_page.controls],
	["BACK", menu_element_type.page_transfer, menu_page.main],
);
 
ds_menu_audio = create_menu_page(
	["MASTER", menu_element_type.slider, change_volume, 1, [0,1]],
	["SOUNDS", menu_element_type.slider, change_volume, 1, [0,1]],
	["MUSIC", menu_element_type.slider, change_volume, 1, [0,1]],
	["BACK", menu_element_type.page_transfer, menu_page.settings]
);
 
ds_menu_graphics = create_menu_page(
	["RESOLUTION", menu_element_type.shift, change_resolution, 0, ["100x100","200x200","300x300"]],
	["FULLSCREEN", menu_element_type.toggle, change_window_mode, 0, ["WINDOWED","FULLSCREEN"]],
	["BACK", menu_element_type.page_transfer, menu_page.settings]
);
 
ds_menu_controls = create_menu_page(
	["UP", menu_element_type.input, "key_up", vk_up],
	["DOWN", menu_element_type.input, "key_down", vk_down],
	["LEFT", menu_element_type.input, "key_left", vk_left],
	["RIGHT", menu_element_type.input, "key_right", vk_right],
	
	["BACK", menu_element_type.page_transfer, menu_page.settings]
);
 
page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_graphics, ds_menu_controls];
 
var i = 0;
var array_len = array_length(menu_pages);
repeat(array_len) {
menu_option[i] = 0;
i++;
}
 
inputting = false;
 
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);