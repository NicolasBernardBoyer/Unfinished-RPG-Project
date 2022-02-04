#region DEFINE KEYS
	global.PL = false; //LEFT
	global.PR = false; //RIGHT
	global.PU = false; //UP
	global.PD = false; //DOWN
	
	global.POK = false; //OK
	global.PCAN = false; //CANCEL (DELETE)
	
	global.PSEL = false;
#endregion

showLowerCase = false; //Show lower case or not

spaces = "________"; //Spaces underlining the name

currentName = "";

#macro MAX_LETTERS_IN_NAME 8

gridX = 0; //Our X coordinate in the grid
gridY = 0; //Our Y coordinate in the grid

letterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ   ";

xLetters = 10;
yLetters = 3;

charCount = 1;

for(var yy = 0; yy < yLetters; yy ++){
	for (var xx = 0; xx < xLetters; xx++){
		if(charCount <= 29){
			a_letters[xx,yy] = string_char_at(letterString, charCount);
			}else{
				a_letters[xx, yy] = "OK"
			}
		
		charCount ++;
	}
}