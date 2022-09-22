#region MOVE THE CURSOR
	if (!buttonREADY){
		if (global.HD || global.HL || global.HR || global.HU){
			buttonTimer++;
		}
		
		if (buttonTimer >= timeTillButtonREADY){
			buttonTimer = 0;
			buttonREADY = true;
		}
		
		if (global.PD || global.PL || global.PR || global.PU){
			buttonTimer = 0;
			buttonREADY = true;
		}
	}
	
	if (global.RD || global.RL || global.RR || global.RU){
		buttonTimer = 0;
		buttonREADY = false;
	}
	
	if(buttonREADY){
		if (global.PL or global.HL){
		//audio
		if (!global.PR and !global.HR){
			audio_play_sound(snd_typewriter, 5, false);
		}
		if (gridX = 9 and gridY = 2) gridX = 5;
		else if (gridX - 1) < 0 gridX = (xLetters - 1);
		else gridX --;
		}
	
		if (global.PR or global.HR){
		if (!global.PL and !global.HL){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (gridX = 5 and gridY = 2) gridX = 9;
			else if (gridX + 1) >= xLetters gridX = 0;
			else gridX ++;
		}
	
		if (global.PU or global.HU){
		if (!global.PD and !global.HD and !global.HL and !global.HR and !global.PL and !global.PR){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (gridY = 0 and gridX > 5 and gridX != 9) gridY = 1;
			else if (gridY - 1) < 0 gridY = (yLetters - 1);
			else gridY --;
		}
	
		if (global.PD or global.HD){
		if (!global.PU and !global.HU and !global.HL and !global.HR and !global.PL and !global.PR){
			audio_play_sound(snd_typewriter, 5, false);
		}
			if (gridY = 1 and gridX > 5 and gridX != 9) gridY = 0;
			else if (gridY + 1) >= yLetters gridY = 0;
			else gridY ++;
		}
		
		buttonREADY = false;
		
}



#endregion

#region PRESSED OK

if (global.POK){
	var newLetter = a_letters[gridX, gridY];
	
	//Save the new name to the hero
	if (newLetter == "OK" and currentName != ""){
		global.playerName = currentName;
		audio_play_sound(snd_select, 5, false);
		instance_destroy(obj_textbox);
		instance_destroy(ev_intro);
		instance_create_layer(0,0, "Instances", ev_intro_2);
		instance_destroy(self);
	} else if(newLetter == "OK" and currentName == ""){
		audio_play_sound(snd_buzz, 6, false);
	}
	
	//Check if we're at max letters for the name or not
	letterCount = string_length(currentName);
		
	//Add letter to name (check if it's not the OK button before adding)
	if ((newLetter != "OK") and (letterCount < MAX_LETTERS_IN_NAME) and newLetter != " "){
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
	audio_play_sound(global.s_back, 5, false);
	
	//Check we have at least 1 letter in the name
	letterCount = string_length(currentName);
	
	//If we have at least 1, delete it
	if (letterCount >= 1) currentName = string_delete(currentName, letterCount, 1);
}

#endregion

#region CHANGE CAPITALISATION

if (string_length(currentName) = 0){
	showLowerCase = false;
} else {
	showLowerCase = true;
}

#endregion