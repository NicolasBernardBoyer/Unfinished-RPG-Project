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


show_lower_case = false; //Show lower case or not

spaces = "________"; //Spaces underlining the name

current_name = "";

button_ready = false; //Ready for cursor to move to next letter or not (set by pressing/holding buttons)
button_timer = 0; //Times how many steps the button has been held for
time_till_button_ready = 10; //This is how many steps a player has to hold a button for before button_ready becomes true - this is bypassed by just prESSING a button

#macro MAX_LETTERS_IN_NAME 8

grid_x = 0; //Our X coordinate in the grid
grid_y = 0; //Our Y coordinate in the grid

letter_string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ   ";

x_letters = 10;
y_letters = 3;

char_count = 1;

// add every character to an array
for(var yy = 0; yy < y_letters; yy ++){
	for (var xx = 0; xx < x_letters; xx++){
		if(char_count <= 29){
			a_letters[xx,yy] = string_char_at(letter_string, char_count);
			}else{
				a_letters[xx, yy] = "OK"
			}
		
		char_count ++;
	}
}