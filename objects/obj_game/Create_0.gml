// variables that will never be used
portrait_index = 0;
voice = snd_typewriter;
name = "";


global.pad_num = 0;

radius = 8;
active_textbox = noone;
// determine where or not the textbox is at the top or bottom of screen
global.highbox = false;

// create particle system
global.partSystem = part_system_create();
part_system_depth(global.partSystem, 100);

facing = 0;

// save slot and difficulty
global.gameSaveSlot = 0;
global.difficultySet = 0;

//Player Position
global.targetX = 0;
global.targetY = 0;

#region PARTY INFO

global.money = 100;

#endregion

// global variables for text and pausing
global.pause = false;
global.name_text_col = c_white;
global.hasname = false;
global.hasportrait = false;

// variables for transitions
blackAlpha = 0;
spawnRoom = -1;
spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;
global.doTransition = false;

// determine direction
enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

#region STATE VARIABLES
global.inventoryOpen = false;
global.inBattle = false;
global.canPause = true;
global.inventoryTB = true;
#endregion

#region INFORMATION VARAIBLES
global.playerName = "New Person";
global.previousRoom = rm_yourbedroom;

#endregion

#region EVENT VARIABLES
global.hasCoat = false;
global.hasBackpack = false;
global.playintro = true;
#endregion

#region SOUND EFFECT VARIABLES
global.s_buzz		= snd_buzz;
global.s_door		= snd_door;
global.s_move		= snd_move;
global.s_punch		= snd_punch;
global.s_select		= snd_select;
global.s_typewriter = snd_typewriter;
global.s_heal		= snd_heal;
global.s_back		= snd_back;
global.s_whip		= snd_whip;
global.s_bike		= snd_bike;
global.s_birds		= snd_birds;
#endregion

#region MUSIC VARIABLES

#endregion

#region Camera and Window size variables
global.view_width  = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);
global.game_width  = 640;
global.game_height = 360;
display_set_gui_size(global.game_width, global.game_height);
global.monitor_w = display_get_width();
global.monitor_h = display_get_height();
#endregion

#region KEYBOARD CONTROLS
	global.key_revert	= ord("X");
	global.key_confirm	= ord("Z");
	global.key_enter	= vk_enter;
	global.key_left		= vk_left;
	global.key_right	= vk_right;
	global.key_up		= vk_up;
	global.key_down		= vk_down;
	global.key_esc		= vk_escape;
	global.key_del		= vk_backspace;
	global.key_shift	= vk_shift;
	global.key_inventory= ord("C");
#endregion

#region CONTROLLER CONTROLS
	global.gp_revert	= gp_face2;
	global.gp_confirm	= gp_face1;
	global.gp_enter		= gp_select;
	global.gp_left		= gp_padl;
	global.gp_right		= gp_padr;
	global.gp_up		= gp_padu;
	global.gp_down		= gp_padd;
	global.gp_esc		= gp_start;
	global.gp_del		= gp_face2;
	global.gp_shift		= gp_face3;
	global.gp_inventory = gp_face4;
	global.gp_shoulderR = gp_shoulderrb;
	global.gp_shoulderL = gp_shoulderlb;
#endregion

buttonREADY = false; //Ready for cursor to move to next letter or not (set by pressing/holding buttons)
buttonTimer = 0; //Times how many steps the button has been held for
timeTillButtonREADY = 10; //This is how many steps a player has to hold a button for before buttonREADY becomes true - this is bypassed by just PRESSING a button

#region DEFINE KEYS
	global.PL = false; //LEFT
	global.PR = false; //RIGHT
	global.PU = false; //UP
	global.PD = false; //DOWN
	
	global.POK = false; //OK
	global.PCAN = false; //CANCEL (DELETE)
	global.PESC = false; //ESCAPE/PAUSE
	
	global.HL = false; //HELD LEFT
	global.HR = false; //HELD RIGHT
	global.HU = false; //HELD UP
	global.HD = false; //HELD DOWN
	global.HRUN = false; //HELD RUN
	
	global.RL = false; //RELEASED LEFT
	global.RR = false; //RELEASED RIGHT
	global.RU = false; //RELEASED UP
	global.RD = false; //RELEASED DOWN
	
	global.PSEL = false;
	global.PINV = false;
#endregion

audio_group_load(audiogroup_music); // LOAD AUDIO GROUPS
audio_group_load(audiogroup_soundeffects);


