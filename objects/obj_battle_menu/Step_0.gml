if (active)
{
	//Control menu with keyboard
	hover += global.PD - global.PU;
	if (hover > array_length(options)-1) hover = 0;
	if (hover < 0) hover = array_length(options)-1;
	
	//Execute selected option
	if (global.POK){
		if (array_length(options[hover]) > 1) && (options[hover][3] == true)
		{
			
		}
	}
}