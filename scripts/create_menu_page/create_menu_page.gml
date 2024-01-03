
//@arg ["Name1",type1,entries1...]
//@arg ["Name2",type2,entries2...]

function create_menu_page(){
	
	// create a new obj_menu page with all the options depending on the amount of you have
	var arg, i = 0;
	repeat(argument_count){
		arg[i] = argument[i];
		i++;
	}
	
	// min 5, max infinite
	var ds_grid_id = ds_grid_create(5, argument_count);
	i = 0; repeat(argument_count){
		var array = arg[i];
		var array_len = array_length(array);
		
		var xx = 0; repeat(array_len){
			ds_grid_id[# xx, i] = array[xx];
			xx++;
		}
		
		i++;
	}
	
	return;
}