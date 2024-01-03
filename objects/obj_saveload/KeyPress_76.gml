//erase current game state

with (obj_par_object) instance_destroy();

// if there is a saved file, load it
if (file_exists("savedgame.save"))
{
	var _buffer = buffer_load("savedgame.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _load_data = json_parse(_string);
	
	//Put all instances back
	while (array_length(_load_data) > 0)
	{
		var load_entity = array_pop(_load_data);
		with (instance_create_layer(0,0,layer,asset_get_index(load_entity.obj)))
		{
			x = load_entity.x;
			y = load_entity.y;
			image_blend = load_entity.image_blend;
			image_index = load_entity.image_index;
		}
	}
	show_debug_message("game loaded! " + _string);
}