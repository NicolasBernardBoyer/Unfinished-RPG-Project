if(place_meeting(x,y, obj_player)){
	// if I haven't already created my textbox, make one:
	if(keyboard_check_pressed(ord("Z")) && string_length(myText[0]) != 0){
		
		if(myTextbox == noone) {
		myTextbox = instance_create_layer(x,y, "Text", obj_textbox);
		myTextbox.text = myText;
		myTextbox.creator = self;
		myTextbox.name = myName;
		}
		
	}
} else {
	if (myTextbox != noone) {
		with(myTextbox)instance_destroy();
		myTextbox = noone;
	}
}