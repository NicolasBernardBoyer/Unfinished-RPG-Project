portrait_index = 0;
voice = snd_typewriter;
name = "";

radius = 8;
active_textbox = noone;
global.highbox = false;

facing = 0;

global.gameSaveSlot = 0;

//Player Position
global.targetX = 0;
global.targetY = 0;

#region PARTY INFO

global.money = 100;

#region PARTY MAX HP
global.MAXplayerHP = 80;
global.MAXkatHP	= 60;
global.MAXmomHP	= 60;
global.MAXnatHP	= 120;
global.MAXrobHP	= 70;
global.MAXjusticHP = 200;
global.MAXsamHP  = 80;
global.MAXsidHP	= 100;
#endregion

#region PARTY HP
global.playerHP = 80;
global.katHP	= 60;
global.momHP	= 60;
global.natHP	= 120;
global.robHP	= 70;
global.justicHP = 200;
global.samHP    = 80;
global.sidHP	= 100;
#endregion

#region PARTY ATK
global.playerATK= 10;
global.katATK	= 5;
global.momATK	= 4;
global.natATK	= 20;
global.robATK	= 5;
global.justicATK= 30;
global.samATK   = 10;
global.sidATK	= 18;
#endregion

#region PARTY SPD
global.playerSPD= 10;
global.katSPD	= 48;
global.momSPD	= 24;
global.natSPD	= 64;
global.robSPD	= 65;
global.justicSPD= 50;
global.samSPD   = 15;
global.sidSPD	= 55;
#endregion

#region PARTY DEF
global.playerDEF= 40;
global.katDEF	= 10;
global.momDEF	= 5;
global.natDEF	= 60;
global.robDEF	= 25;
global.justicDEF= 100;
global.samDEF   = 35;
global.sidDEF	= 55;
#endregion

#region PARTY LUCK
global.playerLK = 5;
global.katLK	= -5;
global.momLK	= 5;
global.natLK	= 2;
global.robLK	= 10;
global.justicLK = 0;
global.samLK    = 6;
global.sidLK	= 3;
#endregion

#endregion

global.pause = false;
global.name_text_col = c_white;
global.hasname = false;
global.hasportrait = false;

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
global.game_width  = 384;
global.game_height = 288;
display_set_gui_size(global.game_width, global.game_height);
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
#endregion

#region DEFINE KEYS
	global.PL = false; //LEFT
	global.PR = false; //RIGHT
	global.PU = false; //UP
	global.PD = false; //DOWN
	
	global.POK = false; //OK
	global.PCAN = false; //CANCEL (DELETE)
	
	global.HL = false; //HELD LEFT
	global.HR = false; //HELD RIGHT
	global.HU = false; //HELD UP
	global.HD = false; //HELD DOWN
	
	global.RL = false; //RELEASED LEFT
	global.RR = false; //RELEASED RIGHT
	global.RU = false; //RELEASED UP
	global.RD = false; //RELEASED DOWN
	
	global.PSEL = false;
	global.PINV = false;
#endregion

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundeffects);


