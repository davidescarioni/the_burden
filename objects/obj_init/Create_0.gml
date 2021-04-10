/// Initialize Scribble
//scribble_font_add("fnt_default");

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

//Audio
global.volume_effects = 1;
global.volume_music = 1;

//Checkpoints
global.lastRoom = "";
global.lastCheckpointX = 0;
global.lastCheckpointY = 0;

//Keys
global.roomOneKey = false;

//Level
global.maxLevel = 0;
global.load = false;

//Texts
global.textSpeed = .75;
surface_resize(application_surface,RESOLUTION_W,RESOLUTION_H)

/// Load saved settings
load_data();
loadDataGame();

if !audio_group_is_loaded(audiogroup_soundeffects) {
	audio_group_load(audiogroup_soundeffects)
}


if !layer_exists("Pause") {
	layer_create(10,"Pause");
}
if (room==rm_menu) instance_create_layer(room_width/2,room_height/2,"Pause",obj_title)
else instance_create_layer(x,y,"Pause",obj_menu)