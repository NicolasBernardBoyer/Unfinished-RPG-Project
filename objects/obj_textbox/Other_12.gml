//[script, arg0, arg1...]
//[[script,arg0, arg1...], [script,arg0,arg1...]]

// a script must be an array for it to run, otherwise nothing will run
if(is_array(scripts)) {
	// if is a choice dialogue, only run the script for that choice
	var pagescript = scripts[page];
	if(choice_dialogue and is_array(scripts[page])) pagescript = pagescript[choice];
	// if the page is not -1 (empty), execute the script
	if(pagescript != -1){
		var len = array_length_1d(pagescript);
		if(len == 1){ script_execute(pagescript[0]); }
		else {
			var args = array_create(len-1, 0);
			array_copy(args, 0, pagescript, 1, len-1);
			script_execute_alt(pagescript[0], args);
		}
	}		
}