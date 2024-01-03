//make save array
var _save_data = array_create(0);

//for every instance, create a struct and add it to the array
with (obj_par_object){
	var save_entity = 
	{
		obj : object_get_name(object_index),
		y : y,
		x : y,
		image_index : image_index,
		image_blend : image_blend,
	}
	array_push(_save_data, save_entity);
}

//turn all this data into a JSON string and save it via a buffer
var _string = json_stringify(_save_data);
var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
buffer_write(_buffer, buffer_string, _string);
buffer_save(_buffer, "savedgame.sav");
buffer_delete(_buffer);

show_debug_message("Game saved! " + _string);