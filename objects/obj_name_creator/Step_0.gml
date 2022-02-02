#region PLAYER INPUT
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
	//audio
	audio_play_sound(snd_select, 5, false);
	var newLetter = a_letters[gridX, gridY];
	
	//Save the new name to the hero
	if (newLetter == "OK"){
		global.playerName = currentName;
		
		instance_destroy();
	}
		
	//Add letter to name (check if it's not the OK button before adding)
	if (newLetter != "OK"){
		currentName += newLetter;
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