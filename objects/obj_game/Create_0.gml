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
global.part_system = part_system_create();
part_system_depth(global.part_system, 100);

facing = 0;

// save slot and difficulty
global.game_save_slot = 0;
global.difficulty_set = 0;

//player Position
global.target_x = 0;
global.target_y = 0;

#region PARTY INFO

global.money = 100;

#endregion

// global variables for text and pausing
global.pause = false;
global.name_text_col = c_white;
global.hasname = false;
global.hasportrait = false;

// variables for transitions
black_alpha = 0;
spawn_room = -1;
spawn_x = 0;
spawn_y = 0;
spawn_player_facing = -1;
global.do_transition = false;

// determine direction
enum DIR {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

#region STATE VARIABLES
global.inventory_open = false;
global.in_battle = false;
global.can_pause = true;
global.inventory_tb = true;
#endregion

#region INFORMATION VARAIBLES
global.player_name = "New Person";
global.previous_room = rm_yourbedroom;

#endregion

#region EVENT VARIABLES
global.has_coat = false;
global.has_backpack = false;
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

#region obj_camera and Window size variables
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
	global.gp_shoulder_r = gp_shoulderrb;
	global.gp_shoulder_l = gp_shoulderlb;
#endregion

button_ready = false; //Ready for cursor to move to next letter or not (set by pressing/holding buttons)
button_timer = 0; //Times how many steps the button has been held for
time_till_button_ready = 10; //This is how many steps a player has to hold a button for before button_ready becomes true - this is bypassed by just prESSING a button

#region DEFINE KEYS
	global.pl = false; //left
	global.pr = false; //right
	global.pu = false; //up
	global.pd = false; //down
	
	global.pok = false; //OK
	global.pcan = false; //CANCEL (DELETE)
	global.pesc = false; //ESCAPE/PAUSE
	
	global.hl = false; //HELD left
	global.hr = false; //HELD right
	global.hu = false; //HELD up
	global.hd = false; //HELD down
	global.hrun = false; //HELD RUN
	
	global.rl = false; //RELEASED left
	global.rr = false; //RELEASED right
	global.ru = false; //RELEASED up
	global.rd = false; //RELEASED down
	
	global.psel = false;
	global.pinv = false;
#endregion

audio_group_load(audiogroup_music); // LOAD AUDIO GROUPS
audio_group_load(audiogroup_soundeffects);


