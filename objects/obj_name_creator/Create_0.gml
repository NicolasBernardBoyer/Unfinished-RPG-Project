#region TEXTBOX VARIABLES
box = spr_textbox;
box_x = 32;
box_y = 200;
x_buffer = 14;
y_buffer = 10;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
text_height = string_height("M");
#endregion


showLowerCase = false; //Show lower case or not

spaces = "________"; //Spaces underlining the name

currentName = "";

buttonREADY = false; //Ready for cursor to move to next letter or not (set by pressing/holding buttons)
buttonTimer = 0; //Times how many steps the button has been held for
timeTillButtonREADY = 10; //This is how many steps a player has to hold a button for before buttonREADY becomes true - this is bypassed by just PRESSING a button

#macro MAX_LETTERS_IN_NAME 8

gridX = 0; //Our X coordinate in the grid
gridY = 0; //Our Y coordinate in the grid

letterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ   ";

xLetters = 10;
yLetters = 3;

charCount = 1;

// add every character to an array
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