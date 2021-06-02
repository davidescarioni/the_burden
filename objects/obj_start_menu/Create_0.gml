display_set_gui_size(global.view_width, global.view_height);
load_data();

// Reset tasks 
global.tasklvl1 = false;
global.tasklvl2 = false;

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
if (global.maxLevel==0) {
	ds_menu_main = create_menu_page(
		["NUOVA PARTITA", menu_element_type.script_runner, new_game],
		["OPZIONI", menu_element_type.page_transfer, menu_page.settings],
		["ESCI", menu_element_type.script_runner, exit_game]
	);
} else if (global.maxLevel>=3) && (!(global.completeLevel1) || !(global.completeLevel2) ||  !(global.completeLevel3))  {
	ds_menu_main = create_menu_page(
		["SCEGLI LIVELLO", menu_element_type.script_runner, sel_level],
		["CONTINUA", menu_element_type.script_runner, loadGame],
		["NUOVA PARTITA", menu_element_type.script_runner, new_game],
		["OPZIONI", menu_element_type.page_transfer, menu_page.settings],
		["ESCI", menu_element_type.script_runner, exit_game]
	);
} else if (global.maxLevel>=3) && (global.completeLevel1) && (global.completeLevel2) &&  (global.completeLevel3)  {
	ds_menu_main = create_menu_page(
		["SCEGLI LIVELLO", menu_element_type.script_runner, sel_level],
		["CONTINUA", menu_element_type.script_runner, loadGame],
		["NUOVA PARTITA", menu_element_type.script_runner, new_game],
		["OPZIONI", menu_element_type.page_transfer, menu_page.settings],
		["RICETTA", menu_element_type.script_runner, ricetta],
		["ESCI", menu_element_type.script_runner, exit_game]
	);
} else {
	ds_menu_main = create_menu_page(
		["CONTINUA", menu_element_type.script_runner, loadGame],
		["NUOVA PARTITA", menu_element_type.script_runner, new_game],
		["OPZIONI", menu_element_type.page_transfer, menu_page.settings],
		["CREDITI", menu_element_type.script_runner, credits],
		["ESCI", menu_element_type.script_runner, exit_game]
	);
}
 
ds_settings = create_menu_page(
	["AUDIO", menu_element_type.page_transfer, menu_page.audio],
	["GRAFICA", menu_element_type.page_transfer, menu_page.graphics],
	["CONTROLLI", menu_element_type.page_transfer, menu_page.controls],
	["RESET OPZIONI", menu_element_type.script_runner, reset_settings],
	["INDIETRO", menu_element_type.page_transfer, menu_page.main],
);
 
ds_menu_audio = create_menu_page(
	["TOTALE", menu_element_type.slider, change_volume, 1, [0,1]],
	["SUONI", menu_element_type.slider, change_volume, global.volume_effects, [0,1]],
	["MUSICA", menu_element_type.slider, change_volume, global.volume_music, [0,1]],
	["INDIETRO", menu_element_type.page_transfer, menu_page.settings]
);
 
ds_menu_graphics = create_menu_page(
	["RISOLUZIONE", menu_element_type.shift, change_resolution, 0, ["512x288","1024x576"]],
	["FULLSCREEN", menu_element_type.toggle, change_window_mode, 0, ["WINDOWED","FULLSCREEN"]],
	["INDIETRO", menu_element_type.page_transfer, menu_page.settings]
);
 
ds_menu_controls = create_menu_page(
	["SU", menu_element_type.input, "key_up", global.key_up],
	["GIU", menu_element_type.input, "key_down", global.key_down],
	["SINISTRA", menu_element_type.input, "key_left", global.key_left],
	["DESTRA", menu_element_type.input, "key_right", global.key_right],
	["SALTO", menu_element_type.input, "key_jump", global.key_jump],
	["TOGLI / METTI GUSCIO", menu_element_type.input, "key_eject", global.key_eject],
	["SOLLEVA", menu_element_type.input, "key_eject", global.key_lift],
	["LANCIO", menu_element_type.input, "key_eject", global.key_launch],

	["INDIETRO", menu_element_type.page_transfer, menu_page.settings]
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
 
audio_stop_all();