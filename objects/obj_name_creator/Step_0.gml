#region PLAYER INPUT

//HELD
if (keyboard_check(global.key_right)) global.PR = true;
else global.HR = false;

if (keyboard_check(global.key_left)) global.PL = true;
else global.HL = false;

if (keyboard_check(global.key_up)) global.PU = true;
else global.HU = false;

if (keyboard_check(global.key_down)) global.PD = true;
else global.HD = false;

if (keyboard_check(global.key_enter) or keyboard_check(global.key_confirm)) global.POK = true;
else global.HOK = false;

if (keyboard_check(global.key_revert) or keyboard_check(global.key_del)) global.PCAN = true;
else global.HCAN = false;

//RELEASED
if (keyboard_check_pressed(global.key_right)) global.PR = true;
else global.PR = false;

if (keyboard_check_pressed(global.key_left)) global.PL = true;
else global.PL = false;

if (keyboard_check_pressed(global.key_up)) global.PU = true;
else global.PU = false;

if (keyboard_check_pressed(global.key_down)) global.PD = true;
else global.PD = false;

if (keyboard_check_pressed(global.key_enter) or keyboard_check_pressed(global.key_confirm)) global.POK = true;
else global.POK = false;

if (keyboard_check_pressed(global.key_revert) or keyboard_check_pressed(global.key_del)) global.PCAN = true;
else global.PCAN = false;

//PRESSED
if (keyboard_check_pressed(global.key_right)) global.PR = true;
else global.PR = false;

if (keyboard_check_pressed(global.key_left)) global.PL = true;
else global.PL = false;

if (keyboard_check_pressed(global.key_up)) global.PU = true;
else global.PU = false;

if (keyboard_check_pressed(global.key_down)) global.PD = true;
else global.PD = false;

if (keyboard_check_pressed(global.key_enter) or keyboard_check_pressed(global.key_confirm)) global.POK = true;
else global.POK = false;

if (keyboard_check_pressed(global.key_revert) or keyboard_check_pressed(global.key_del)) global.PCAN = true;
else global.PCAN = false;

if (keyboard_check_pressed(global.key_shift)) global.PSEL = true;
else global.PSEL = false;


#endregion

#region MOVE THE CURSOR

	if (global.PL){
		//audio
		audio_play_sound(snd_typewriter, 5, false);
		if (gridX - 1) < 0 gridX = (xLetters - 1);
		else gridX --;
	}
	
	if (global.PR){
		audio_play_sound(snd_typewriter, 5, false);
		if (gridX + 1) >= xLetters gridX = 0;
		else gridX ++;
	}
	
	if (global.PU){
		audio_play_sound(snd_typewriter, 5, false);
		if (gridY - 1) < 0 gridY = (yLetters - 1);
		else gridY --;
	}
	
	if (global.PD){
		audio_play_sound(snd_typewriter, 5, false);
		if (gridY + 1) >= yLetters gridY = 0;
		else gridY ++;
	}


#endregion

#region PRESSED OK

if (global.POK){
	var newLetter = a_letters[gridX, gridY];
	
	//Save the new name to the hero
	if (newLetter == "OK" and currentName != ""and currentName != " "and currentName != "  " and currentName != "   "and currentName != "    "and currentName != "     "and currentName != "      "and currentName != "       " and currentName != "        "){
		global.playerName = currentName;
		audio_play_sound(snd_select, 5, false);
		instance_create_layer(0,0, "Instances", ev_intro_2);
		instance_destroy();
	} else if(newLetter == "OK" and (currentName == ""or currentName == " "or currentName == "  " or currentName == "   "or currentName == "    "or currentName == "     "or currentName == "      "or currentName == "       " or currentName == "        ")){
		audio_play_sound(snd_buzz, 6, false);
	}
	
	//Check if we're at max letters for the name or not
	letterCount = string_length(currentName);
		
	//Add letter to name (check if it's not the OK button before adding)
	if (newLetter != "OK") and (letterCount < MAX_LETTERS_IN_NAME) and (!instance_exists(obj_textbox)){
		audio_play_sound(snd_select, 5, false);
		
		//CHANGE TO LOWER CASE IF NEEDED
		if (showLowerCase) and (newLetter != " "){
			uniCode = ord(newLetter) + 32;
			newLetter = chr(uniCode);
		}
		
		currentName += newLetter;
	} else if (letterCount >= MAX_LETTERS_IN_NAME) {
		audio_play_sound(snd_buzz, 6, false);
	}
	
}
#endregion

#region PRESSED CANCEL

if (global.PCAN){
	//audio
	audio_play_sound(snd_select, 5, false);
	
	//Check we have at least 1 letter in the name
	letterCount = string_length(currentName);
	
	//If we have at least 1, delete it
	if (letterCount >= 1) currentName = string_delete(currentName, letterCount, 1);
}

#endregion

#region CHANGE CAPITALISATION

if (global.PSEL){
	showLowerCase = !showLowerCase;
}

#endregion