global.pause = false;
global.name_text_col = c_white;
global.hasname = false;

blackAlpha = 0;

spawnRoom = -1;
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
doTransition = false;

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

global.inventoryOpen = false;
global.inBattle = false;
global.playerName = "New Guy";

global.hasCoat = false;
global.hasBackpack = false;

// Camera and Window size variables
#region
global.view_width  = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);
global.game_width  = 384;
global.game_height = 288;
display_set_gui_size(global.game_width, global.game_height);
#endregion

// Controls
#region
	global.key_revert	= ord("X");
	global.key_confirm	= ord("Z");
	global.key_enter	= vk_enter;
	global.key_left		= vk_left;
	global.key_right	= vk_right;
	global.key_up		= vk_up;
	global.key_down		= vk_down;
	global.key_esc		= vk_escape;
#endregion

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);


